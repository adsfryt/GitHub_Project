pipeline {
  agent any
  parameters {
    choice(name: 'ENV', choices: ['dev', 'prod'], description: 'Целевая среда')
  }
  stages {
    stage('Start') {
      steps {
        echo "Deploying to ${params.ENV}"
      }
    }
    stage('Clean workspace') {
      steps {
        deleteDir()
      }
    }
    stage('Copy to server') {
      steps {
        // Предполагается, что Publish Over SSH plugin настроен под именем 'remote-server'
        sshPublisher(publishers: [
          sshPublisherDesc(
            configName: 'remote-server',
            transfers: [
              sshTransfer(
                sourceFiles: '**/*',
                removePrefix: '',
                remoteDirectory: "/var/www/${params.ENV}"
              )
            ]
          )
        ])
      }
    }
  }
}
