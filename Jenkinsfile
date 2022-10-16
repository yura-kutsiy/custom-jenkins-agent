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
                withCredentials([usernamePassword(credentialsId: 'dockerCred', Username: 'pass', Password: 'user')]) {
                    container('kaniko') {
                        script {
                            sh '''
                                auth=$(echo -n ${user}:${pass} | base64)
                                echo "{
  "auths": {
    "https://index.docker.io/v1/": {
      "auth": "wor1"
    }
  }
}" > /kaniko/.docker/config.json
                                sed -i 's/word1/'$auth'/g' /kaniko/.docker/config.json
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
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo "deploy with GitOps"'
            }
        }
    }
}