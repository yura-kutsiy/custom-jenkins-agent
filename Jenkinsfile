pipeline { 
    agent { label "kaniko" } 
    options {
        ansiColor('xterm')
        timestamps ()
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }
    stages {
                // the code here can access $pass and $user
            stage('Build') { 
                steps { 
                withCredentials([file(credentialsId: 'config.json', variable: 'FILE')]) {
                    // sh 'use $FILE'
                    container('kaniko') {
                        script {
                            sh '''
                                cat $FILE > /kaniko/.docker/config.json
                                /kaniko/executor --context `pwd` \
                                                 --label include=curl-popeye-trivy \
                                                 --snapshotMode=full \
                                                 --cache=true \
                                                 --cache-repo yurasdockers/jenkins-agent-cache \
                                                 --destination yurasdockers/jenkins-agent:0.4
                            '''
                        }
                    }
                }           
                }
            }
        stage('Test'){
            steps {
                sh 'echo "testing will be here"'
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo "deploy with GitOps"'
            }
        }
    }
}