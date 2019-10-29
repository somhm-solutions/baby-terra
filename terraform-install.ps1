mkdir Terraform;
cd Terraform;

$client = New-Object System.Net.WebClient

$url = 'https://releases.hashicorp.com/terraform/0.12.12/terraform_0.12.12_windows_amd64.zip'
$path = './Terraform'

$client.DownloadFile($url, $path)