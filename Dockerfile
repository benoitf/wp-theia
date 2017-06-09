FROM eclipse/node
RUN cd $HOME && git clone https://github.com/theia-ide/theia
RUN sudo apt-get update
RUN sudo apt-get install -y python
RUN cd $HOME/theia && npm install --no-optional
RUN cd $HOME/theia && cd config/local-dependency-manager && npm install && cd ../../examples/browser && npm run bootstrap
CMD cd $HOME/theia/examples/browser && (node ./lib/backend/main.js --root-dir=/projects &) && npm run start:frontend

LABEL che:server:3000:ref=theia che:server:3000:protocol=http
