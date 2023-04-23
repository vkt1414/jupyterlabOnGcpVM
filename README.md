<!DOCTYPE html>
<html>
<body>
  <h1> Jupyter Lab on a GCP VM!</h1>
  <h2>Introduction</h2>
  <p>This repo contains the terraform template to install jupyterlab on docker in a GCP VM.</p>
  <h2>Prerequisites</h2>
  <p>You must have the following installed on your machine:</p>
  <ul>
    <li>Terraform</li>
    <li>Google Cloud SDK</li>
<p>*Both of these are pre-installed in gcp cloud shell:</p>  
  </ul>
  <h2>Steps to Deploy</h2>
  <h3>Step 1: Clone this repository</h3>
  <p>Clone this repository to your local machine by running the following command:</p>
  <pre><code>https://github.com/vkt1414/jupyterlabOnGcpVM.git</code></pre>
  <h3>Step 2: Navigate to the directory</h3>
  <p>Change your working directory to the cloned repository:</p>
  <pre><code>cd jupyterlabOnGcpVM/Terraform</code></pre>
  <h3>Step 3: Configure the variables</h3>
  <p>Edit the values in the <code>myvars.tfvars.example</code> file and rename it to <code>myvars.tfvars</code> file to match your desired configuration.</p>
  <h3>Step 4: Initialize Terraform</h3>
  <p>Run the following command to initialize Terraform:</p>
  <pre><code>terraform init</code></pre>
  <h3>Step 5: Preview the changes</h3>
  <p>Run the following command to see what changes Terraform will make:</p>
  <pre><code>terraform plan</code></pre>
  <h3>Step 6: Apply the changes</h3>
  <p>Run the following command to apply the changes:</p>
  <pre><code>terraform apply -var-file=myvars.tfvars</code></pre>
  <h3>Step 7: Access the Jupyter notebook</h3>
  <strong>Access the JupyterLab:</strong></p>

  <p>After running the above command, Terraform will create a virtual machine instance on GCP with JupyterLab running on Docker. To access the JupyterLab:</p>
  <ol>
    <li>Go to the <strong>Compute Engine</strong> section of your GCP console.</li>
    <li>Find the instance with the name you specified in your <code>myvars.tfvars</code> file.</li>
    <li>Copy the external IP address of the instance.</li>
    <li>Open a web browser and go to <code>http://external-ip-address:8888</code> to access JupyterLab. </li>
    <li>If prompted for a token, leave the field blank and click the "Log in" button.</li>
  </ol>
  <p>You can now use JupyterLab on your GCP instance!</p>
  <strong>Destroying the Infrastructure:</strong></p>

<p>To destroy the infrastructure created by Terraform, navigate to the directory where you ran Terraform and run the following command:</p>
<pre><code>terraform destroy -var-file=myvars.tfvars</code></pre>
<p>This will destroy the virtual machine instance and delete all associated resources, including the disk and firewall rule. Be careful when running this command, as it cannot be undone.</p>
<strong>Security Implications:</strong></p>

<p>By default, the JupyterLab instance is accessible to anyone who has the external IP address and port number. This can pose a security risk, especially if you are not using a secure connection. To improve security:</p>
<ol>
  <li>Consider using a firewall rule to restrict access to specific IP ranges.</li>
  <li>Use a secure connection (HTTPS) to access the JupyterLab.</li>
  <li>Consider using authentication tokens for JupyterLab to restrict access to authorized users.</li>
</ol>
<p>It is important to be aware of these security implications and take appropriate measures to secure your JupyterLab instance.</p>






  
</body>
</html>





