# Apache Tomcat on Ubuntu 16.04

Apache Tomcat is an open-source software implementation of the Java Servlet and Java Server Pages technologies. You’ll run applications within Tomcat using the OpenJDK implementation of the Java development environment.

# Install Apache Tomcat

Install Tomcat from the Ubuntu repository:

    apt-get install tomcat8

Note: OpenJDK will be installed as a dependency when you install the tomcat8 package. OpenJDK is included with the default-java meta package in Ubuntu.

You may also want to install the tomcat8-docs, tomcat8-examples, and tomcat8-admin tools which provide web-based applications that document, test, and allow you to administer Tomcat. You can install all three with the following command:

    apt-get install tomcat8-docs tomcat8-examples tomcat8-admin

If you need to start, stop or restart Tomcat you can use the following commands:

    systemctl start tomcat8
    systemctl stop tomcat8
    systemctl restart tomcat8

# Test and Use Tomcat

You can test your Tomcat installation by pointing your browser at your site’s port :8080, http://example.com:8080/. Note that Tomcat listens on network port 8080 and does not accept forced HTTPS connections by default. By default, Tomcat configuration files are located in the /var/lib/tomcat8/conf directory.

To use the tomcat8-admin web application, add the following lines to the end of your /var/lib/tomcat8/conf/tomcat-users.xml file before the </tomcat-users> line, substituting your own username and secure password. If using Tomcat Admin, include both the “manager-gui” role for the manager and the “admin-gui” role for the host-manager application.

If you are not using the web application and plan to manage your application(s) from the command line only, you should not enter these lines, because doing so may expose your server to unauthorized login attempts.

**File excerpt: /var/lib/tomcat8/conf/tomcat-users.xml**

    <role rolename="manager-gui"/>
    <role rolename="admin-gui"/>
    <user username="username" password="password" roles="manager-gui, admin-gui"/>

Restart the Tomcat server, which will allow these changes to take effect:

    systemctl restart tomcat8

Congratulations! You now have a working Apache Tomcat installation.