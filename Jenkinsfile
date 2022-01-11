pipeline {
    agent any
	
	  tools
    {
       maven "Maven"
    }
 stages {
      stage('checkout') {
           steps {
             
                git branch: 'master', url: 'https://github.com/vishnukr3/springboot-java.git'
             
          }
        }
	 stage('Execute Maven') {
           steps {
             
                sh 'mvn package'             
          }
        }
        

  stage('Docker Build and Tag') {
           steps {
              
                sh 'docker build -t springboot-java:latest .' 
                sh 'docker tag Springboot-java vkr1998/springboot-java:latest'
                //sh 'docker tag springboot-java nikhilnidhi/Springboot-java:$BUILD_NUMBER'
               
          }
        }
     
  stage('Publish image to Docker Hub') {
          
            steps {
        withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) {
          sh  'docker push vkr1998/springboot-java:latest'
        //  sh  'docker push vkr1998/springboot-java:$BUILD_NUMBER' 
        }
                  
          }
        }
     
      stage('Run Docker container on Jenkins Agent') {
             
            steps 
			{
                sh "docker run -d -p 8003:8080 vkr1998/springboot-java"
 
            }
        }
 stage('Run Docker container on remote hosts') {
             
            steps {
                sh "docker -H ssh://jenkins@18.223.109.244 run -d -p 8003:8080 vkr1998/springboot-java"
 
            }
        }
    }
	}
    
