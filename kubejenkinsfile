pipeline {
  options {
    ansiColor('xterm')
  }
  agent {
    kubernetes {
      yamlFile 'builder.yaml'
    }
  }
  tools{
      jdk 'myjava'
      maven 'mymaven'
  }

  stages {

    stage("Checkout code") {
        steps {
            checkout scm
        }
    }
    stage("Package") {
        steps {
            sh "mvn clean package"
        }
    }
  
  stage('Kaniko Build & Push Image') {
   environment {
                PATH = "/busybox:/kaniko:$PATH"
            }
      steps {
        container(name: 'kaniko',  shell: '/busybox/sh') {
          script {
            sh '''#!/busybox/sh
            /kaniko/executor   --dockerfile `pwd`/Dockerfile \
                             --context `pwd` \
                             --destination=kalyand14/myimage:${BUILD_NUMBER}
            '''
          }
        }
      }
    }


    stage('Deploy App to Kubernetes') {     
      steps {
        container('kubectl') {
          withCredentials([file(credentialsId: 'mykubeconfig', variable: 'KUBECONFIG')]) {
            sh 'sed -i "s/<TAG>/${BUILD_NUMBER}/" deployment.yaml'
            sh 'kubectl apply -f deployment.yaml'
          }
        }
      }
    }
  
  }
}
