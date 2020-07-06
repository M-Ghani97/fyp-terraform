// // Jenkinsfile
// String credentialsId = 'awsCredentials'

// try {
//   agent {
//     docker {
//       image 'hashicorp/terraform:light'
//       args '--entrypoint='
//     }
//   }
//   stage('checkout') {
//     node {
//       cleanWs()
//       checkout scm
//     }
//   }

//   // Run terraform init
//   stage('init') {
//     node {
//       withCredentials([[
//         $class: 'AmazonWebServicesCredentialsBinding',
//         credentialsId: credentialsId,
//         accessKeyVariable: 'AWS_ACCESS_KEY_ID',
//         secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
//       ]]) {
//         ansiColor('xterm') {
//           sh 'terraform init'
//         }
//       }
//     }
//   }

//   // Run terraform plan
//   stage('plan') {
//     node {
//       withCredentials([[
//         $class: 'AmazonWebServicesCredentialsBinding',
//         credentialsId: credentialsId,
//         accessKeyVariable: 'AWS_ACCESS_KEY_ID',
//         secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
//       ]]) {
//         ansiColor('xterm') {
//           sh 'terraform plan'
//         }
//       }
//     }
//   }

//   if (env.BRANCH_NAME == 'master') {

//     // Run terraform apply
//     stage('apply') {
//       node {
//         withCredentials([[
//           $class: 'AmazonWebServicesCredentialsBinding',
//           credentialsId: credentialsId,
//           accessKeyVariable: 'AWS_ACCESS_KEY_ID',
//           secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
//         ]]) {
//           ansiColor('xterm') {
//             sh 'terraform apply -auto-approve'
//           }
//         }
//       }
//     }

//     // Run terraform show
//     stage('show') {
//       node {
//         withCredentials([[
//           $class: 'AmazonWebServicesCredentialsBinding',
//           credentialsId: credentialsId,
//           accessKeyVariable: 'AWS_ACCESS_KEY_ID',
//           secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
//         ]]) {
//           ansiColor('xterm') {
//             sh 'terraform show'
//           }
//         }
//       }
//     }
//   }
//   currentBuild.result = 'SUCCESS'
// }
// catch (org.jenkinsci.plugins.workflow.steps.FlowInterruptedException flowError) {
//   currentBuild.result = 'ABORTED'
// }
// catch (err) {
//   currentBuild.result = 'FAILURE'
//   throw err
// }
// finally {
//   if (currentBuild.result == 'SUCCESS') {
//     currentBuild.result = 'SUCCESS'
//   }
// }



pipeline {
  agent {
    docker {
      image 'hashicorp/terraform'
    }
  }
  stages {
    stage('Checkout') {
        steps {
          checkout scm
        }
    }
    stage('Terraform Init') { 
      steps {
        sh 'terraform init ' 
      }
    }
  }
}