# GCP Account Setup Guide (KSA Context)

In the Kingdom of Saudi Arabia (KSA), Google Cloud Platform (GCP) is handled by a tyranious company who let no space for people to use GCP freely ☭ . Due to the unavailability of the free trial in the kingdom, students will be hosted on Lewagon's billing account allowing them to enjoy GCP products responsibly.


# Students instructions

Students have actually two choices for the setup, either through the console, either through google cloud.

Visit the website console.google.com and do as the picture below.

![GCP Website](images/gp.png)

After that, act depeding of your option (CLI should be the quickest one)

## CLI

Run this code in your terminal, be sure to change <BILLING_ACCOUNT> by the one provided for you by your BM.

```bash
gcloud components update
gcloud billing accounts list

# Create project
gcloud projects create "Lewagon-${GITHUB_USERNAME}-datascience"

# Set billing account
gcloud billing projects link "Lewagon-${GITHUB_USERNAME}-datascience" --billing-account <BILLING_ACCOUNT>

# Set budget alerts per 1$
gcloud billing budgets create \
	--billing-account=<BILLING_ACCOUNT> \
	--display-name="Lewagon-${GITHUB_USERNAME}-datascience" \
	--filter-projects=projects/"Lewagon-${GITHUB_USERNAME}-datascience" \
	--budget-amount=5 \
	--threshold-rule=percent=0.20 \
	--threshold-rule=percent=0.40 \
	--threshold-rule=percent=0.60 \
	--threshold-rule=percent=0.80

```

❌ If an error appeared, call the BM / TA 🙋‍♂️

## GCP Website

Select through the hamburger menu at the top right the billing section.

![Step 1](images/b3.png)

Once you have clicked, you should arrived on this page with two options

Select link a billing account.

![Step 2](images/b2.png)

Finally, select the billing account provided by the BM to you.

![Step 3](images/b1.png)

If any questions or doesn't seem to work, raise a ticket 🙋‍♂️

Please check with your BM the whole setup ✔️
