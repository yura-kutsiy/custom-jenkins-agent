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
                            /kaniko/executor --dockerfile `pwd`/Dockerfile \
                                             --context `pwd` \
                                             --no-push
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