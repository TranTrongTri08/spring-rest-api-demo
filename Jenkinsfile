//Jenkinsfile (Declarative Pipeline)
pipeline {
  environment {
    registry = "181296/spring-rest-api"
    registryCredential = 'dockerhub'
    dockerImage = ''
    imageTag = ''
  }
  // Specifies where the entire Pipeline, or a specific stage, will execute in the Jenkins environment
  agent any
  stages {
    
    stage('Cloning Git') {
      input {
		message "Press Ok to continue"
		submitter "admin"
		parameters {
			string(name:'username', defaultValue: 'user', description: 'Username of the user pressing Ok')
		}
	}
      steps {
        git 'https://github.com/TranTrongTri08/spring-rest-api-demo.git'
      }
    }
    stage('Build') {
      steps {
        sh 'mvn clean package' 
        echo 'Build app successfully'
      }
    }
    stage('Building image') {
      steps{
        script {
          imageTag = registry + ":$BUILD_NUMBER"
          dockerImage = docker.build imageTag
          echo 'Build image' + imageTag + ' scuccessfully'
        }
      }
    }
     stage('Pushing image to docker hub') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
          echo 'Push image to docker hub scuccessfully'
        }
      }
    }
    stage('Remove unused docker image') {
      steps{
        sh "docker rmi $imageTag"
      }
    }
    stage('Run docker container') {
      steps{
        sh "docker container run -p 8080:8080 $imageTag"
      }
    }
  }
}
