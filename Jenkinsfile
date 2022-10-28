pipeline { 
    agent {
        label "kaniko"
    } 
    options {
        ansiColor('xterm')
    }
    stages {
    // the code here can access $pass and $user
            stage('Build') { 
                steps { 
                withCredentials([file(credentialsId: 'config.json', variable: 'FILE')]) {
    //              sh 'use $FILE'
                    container('kaniko') {
                        script {
                            sh '''
                                cat $FILE > /kaniko/.docker/config.json
                                /kaniko/executor --context `pwd` \
                                                 --destination yurasdockers/jenkins-agent:0.1
                            '''
                        }
                    }
                }           
                }
            }
        stage('Test'){
            steps {
                sh 'echo "testing will be here"'
                sh 'sleep 600'
                sh 'popeye'
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo "deploy with GitOps"'
            }
        }
    }
}