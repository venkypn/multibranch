pipeline{
    agent any
    environment {
             DOCKER_TAG = "getVersion()"
  
    }
    stages { 
        
        stage("GitCode"){
            steps{
               git branch: 'main', credentialsId: '8046693d-a016-4bb7-8e75-8e787b6a672a',
               url: 'https://github.com/venkypn/multibranch.git'
                
            }
            
        }
        stage("Maven Build"){
            steps{
               sh "mvn clean package"
                
            }
            
        }
        stage("Docker Build"){
            steps{
               sh "docker build -t venkypn/multibranch:fnl ."
                
            }
            
        }
        stage("Docker Push"){
            steps{
                withCredentials([string(credentialsId: 'password', variable: 'dockerHubPwd')]) {
                            sh "docker login -u venkypn -p ${dockerHubPwd} "
                }
                        sh "docker push venkypn/multibranch:fnl"
                
            }
            
        }
        stage("Ansible Deployment"){
            steps{
                
                ansiblePlaybook become: true, credentialsId: 'dev-server', installation: 'Ansible', inventory: 'dev.inv', playbook: 'docker_depl.yml'
                
            }
            
        }
        
    }
    
    
}


def getVersion(){
    
   def commitHash = sh "git rev-parse --short HEAD"
   return commitHash
}
