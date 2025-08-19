# First message

Hello @channel,

Next week we will start MLOps week on Google Cloud Platform  A.K.A GCP :gcp:

For you to be able to use GCP services, you need to follow the step below :point_down:

Student guide

To make it simple, you'll create a project through CLI command and link it to the one billing account provided by Lewagon.

To know which billing account to use, please check the one allocated to you on this gsheet :google-sheets-intensifies:

Let me know through tickets if you face any issue or need further explanations. :hand:


## check gcli setup

Good Morning @channel  :sunny:

As I said yesterday, we will start the setup for GCP (Google Cloud Platform) :gcp:.

To make everything smooth, I need two actions from you :
Running this command in your terminal and telling me if it worked or not ( :x: or :white_check_mark:)
gcloud config get-value project
You should receive back the name of your default project or at least (unset), if not :x:
I need the email you are using for GCP / best case a gmail account, please write it in this spreadsheet :spreadsheet:

If you encounter any mistake, I'll solve it with you during the break.

(Should be integrated in the guide)


## check gcp setup

@channel
Regarding GCP  setup :gcp: , can you run the command below :arrow_down:
bq --location=US mk --dataset "${MY_GPROJECT}":ululu
If it goes through, you're good to go :white_check_mark:
You can check on bigquery if you want to see it with your own eyes :eyes:

(should be integrated to the guide)

## Create gcp for projects

```bash
# Create project

export PROJECT_GCP="YOUR-PROJECT@"

gcloud projects create "${PROJECT_GCP}"

gcloud config set project "${PROJECT_GCP}"

# Set billing account
gcloud billing projects link "${PROJECT_GCP}" --billing-account ${BILLING_ACCOUNT}

# Set budget alerts per 1$
gcloud billing budgets create \
	--billing-account="${BILLING_ACCOUNT}" \
	--display-name="${PROJECT_GCP}" \
	--filter-projects=projects/"${PROJECT_GCP}" \
	--budget-amount=10 \
	--threshold-rule=percent=0.20 \
	--threshold-rule=percent=0.40 \
	--threshold-rule=percent=0.60 \
	--threshold-rule=percent=0.80

```
