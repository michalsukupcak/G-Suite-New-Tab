# G Suite New Tab Page

Chrome New Tab Page replacement for G Suite users inspired by Material Design.

![G Suite New Tab](https://cloud.githubusercontent.com/assets/5606432/17082398/f41f13aa-517c-11e6-81fe-10ae55964c0c.png)

You can install the final product for free from the [Chrome Web Store](https://chrome.google.com/webstore/detail/apps-for-work-new-tab/ehpgcagmhpndkmglombjndkdmggkgnge).

### Requirements

Build process requires following CLI software:

- npm: ````$ sudo apt-get install npm````
- bower: ````$ sudo npm install -g bower````
- vulcanize: ````$ sudo npm install -g vulcanize```` 
- crisper: ````$ sudo npm install -g crisper````
- zip: ````$ sudo apt-get install zip````

### Build

Before running build, make sure you have all required dependencies from bower repositories installed:

        $ bower install
        
If you're returning to continue work on the extension after some time, consider updating dependencies to their latest versions using ````bower update````.

Build process creates a ````dist```` folder and a ````dist.zip```` file. You can run the ````build.sh```` file (from project's root folder) to execute entire build process:

        $ sh build.sh

**Alternatively**, you can run parts of the build process yourself. All commands below must be executed in the project's root folder.

1) Run vulcanize (make sure ````dist```` folder and ````dist/index.vulcanized.html```` and ````dist/index.vulcanized.js```` files exist before running the command):
    
        $ vulcanize index.html --inline-script | crisper --html dist/index.vulcanized.html --js dist/index.vulcanized.js 
     
2) Copy manifest.json and images folders to dist folder.

        $ cp -av manifest.json dist/manifest.json
        $ cp -avr images dist/images 
        
3) Now you have two options: Either load contents of the ````dist```` folder into Chrome as unpacked extension, or create zip file from the ````dist```` folder and upload it to Chrome Web Store: 
        
        $ zip -r dist.zip dist

