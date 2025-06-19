
@Library([
  'pipe-build-lib',
  'ces-build-lib',
  'dogu-build-lib'
]) _

def pipe = new com.cloudogu.sos.pipebuildlib.DoguPipe(this, [doguName: 'gotenberg', shellScripts: './resources/startup.sh'])

pipe.setBuildProperties()
pipe.addDefaultStages()
pipe.run()
