To perform an automatic dogu release and push the new image to the Cloudogu Image Registry:

1. Make sure all your release-relevant changes exist on the `develop` branch.
2. Checkout a new branch named like `release/{gotenberg-app-version}-{release-counter}`, e.g. `release/7.9.2-1`
3. Increase your dogu version in the `dogu.json` and `Dockerfile`
4. Prepare the changelog for your new version and check if all changes are mentioned
5. Push your release branch to the repository origin on GitHub

The release branch will trigger the Jenkins to perform a release build which will build, test and push your image to the registry. 