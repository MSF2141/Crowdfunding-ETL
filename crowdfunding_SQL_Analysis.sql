-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT campaign.cf_id, campaign.outcome, campaign.backers_count 
INTO backers_count
FROM campaign
WHERE campaign.outcome = ('live')
GROUP BY campaign.cf_id
ORDER BY campaign.backers_count DESC;


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT * FROM backers_count; 


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT campaign.cf_id,
		campaign.contact_id,
		campaign.company_name,
		campaign.description,
		campaign.goal,
		campaign.pledged,
		campaign.outcome,
		campaign.backers_count,
		campaign.country,
		campaign.currency,
		campaign.launch_date,
		campaign.end_date,
		campaign.category_id,
		campaign.subcategory_id,
		campaign.goal-campaign.pledged AS remaining_goal_amount
INTO campaign_plus_remaining_goal_amount
FROM campaign;

SELECT * FROM campaign_plus_remaining_goal_amount;



SELECT contacts.first_name, contacts.last_name, contacts.email, campaign_plus_remaining_goal_amount.remaining_goal_amount
INTO  email_contacts_remaining_goal_amount
FROM contacts 
RIGHT JOIN campaign_plus_remaining_goal_amount
ON contacts.contact_id = campaign_plus_remaining_goal_amount.contact_id 
WHERE campaign_plus_remaining_goal_amount.outcome = ('live')
GROUP BY contacts.first_name, contacts.last_name, contacts.email, campaign_plus_remaining_goal_amount.outcome, campaign_plus_remaining_goal_amount.remaining_goal_amount 
ORDER BY campaign_plus_remaining_goal_amount.remaining_goal_amount DESC;

-- Check the table
SELECT * FROM  email_contacts_remaining_goal_amount;



-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT DISTINCT ON (backers.email, backers.first_name, backers.last_name) backers.email, backers.first_name, backers.last_name,
	campaign_plus_remaining_goal_amount.cf_id, campaign_plus_remaining_goal_amount.company_name, campaign_plus_remaining_goal_amount.description, campaign_plus_remaining_goal_amount.end_date, campaign_plus_remaining_goal_amount.remaining_goal_amount
INTO email_backers_remaining_goal_amount
FROM backers
RIGHT JOIN campaign_plus_remaining_goal_amount
ON backers.cf_id = campaign_plus_remaining_goal_amount.cf_id
GROUP BY backers.email, backers.first_name, backers.last_name, campaign_plus_remaining_goal_amount.cf_id, campaign_plus_remaining_goal_amount.company_name, campaign_plus_remaining_goal_amount.description, campaign_plus_remaining_goal_amount.end_date, campaign_plus_remaining_goal_amount.remaining_goal_amount
ORDER BY backers.last_name;


-- Check the table
SELECT * FROM email_backers_remaining_goal_amount;
