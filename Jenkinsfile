#!groovy
@Library(['github.com/cloudogu/ces-build-lib@1.64.2', 'github.com/cloudogu/dogu-build-lib@v2.1.0'])
import com.cloudogu.ces.cesbuildlib.*
import com.cloudogu.ces.dogubuildlib.*

node('vagrant') {
    String doguName = "gotenberg"
    String productionReleaseBranch = "main"
    Git git = new Git(this, "cesmarvin")
    git.committerName = 'cesmarvin'
    git.committerEmail = 'cesmarvin@cloudogu.com'
    GitFlow gitflow = new GitFlow(this, git)
    GitHub github = new GitHub(this, git)
    Changelog changelog = new Changelog(this)
    timestamps{
        properties([
                // Keep only the last x builds to preserve space
                buildDiscarder(logRotator(numToKeepStr: '10')),
                // Don't run concurrent builds for a branch, because they use the same workspace directory
                disableConcurrentBuilds()
        ])

        EcoSystem ecoSystem = new EcoSystem(this, "gcloud-ces-operations-internal-packer", "jenkins-gcloud-ces-operations-internal")

        stage('Checkout') {
            checkout scm
        }

        stage('Lint') {
            lintDockerfile()
            shellCheck("resources/startup.sh")

            if (env.CHANGE_TARGET) {
                echo 'This is a pull request; checking changelog...'
                String newChanges = changelog.changesForVersion('Unreleased')
                if (!newChanges || newChanges.allWhitespace) {
                    unstable('CHANGELOG.md should contain new change entries in the `[Unreleased]` section but none were found.')
                }
            }
        }

        try {
            stage('Provision') {
                ecoSystem.provision("/dogu")
            }

            stage('Setup') {
                ecoSystem.loginBackend('cesmarvin-setup')
                ecoSystem.setup()
            }

            stage('Build') {
                ecoSystem.build("/dogu")
            }

            stage('Verify') {
                ecoSystem.verify("/dogu")
            }

            if (gitflow.isReleaseBranch()) {
                String releaseVersion = git.getSimpleBranchName()

                stage('Finish Release') {
                    gitflow.finishRelease(releaseVersion, productionReleaseBranch)
                }

                stage('Push Dogu to registry') {
                    ecoSystem.push("/dogu")
                }

                stage ('Add Github-Release'){
                    github.createReleaseWithChangelog(releaseVersion, changelog, productionReleaseBranch)
                }
            }
        } finally {
            stage('Clean') {
                ecoSystem.destroy()
            }
        }
    }
}
