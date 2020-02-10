#!/usr/bin/env groovy
pipeline {
  environment {
    registry = "181296/spring-rest-api"
    registryCredential = 'dockerhub'
    dockerImage = ''
    imageTag = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
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
