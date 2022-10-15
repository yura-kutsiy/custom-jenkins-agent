pipeline { 
    agent {
        label "kaniko"
    } 
    options {
        ansiColor('xterm')
    }
    stages {
        stage('Build') { 
            steps { 
                container('kaniko') {
                    script {
                        sh '''
                            /kaniko/executor --context `pwd` \
                                             --destination yurasdockers/jenkins-agent:0.1
                        '''
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