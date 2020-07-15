DECLARE
    l_user_id                       NUMBER;
    l_workspace                     VARCHAR2(255);
    l_user_name                     VARCHAR2(100);
    l_first_name                    VARCHAR2(255);
    l_last_name                     VARCHAR2(255);
    l_web_password                  VARCHAR2(255);
    l_email_address                 VARCHAR2(240);
    l_start_date                    DATE;
    l_end_date                      DATE;
    l_employee_id                   NUMBER(15,0);
    l_allow_access_to_schemas       VARCHAR2(4000);
    l_person_type                   VARCHAR2(1);
    l_default_schema                VARCHAR2(30);
    l_groups                        VARCHAR2(1000);
    l_developer_role                VARCHAR2(60);
    l_description                   VARCHAR2(240);
    l_account_expiry                DATE;
    l_account_locked                VARCHAR2(1);
    l_failed_access_attempts        NUMBER;
    l_change_password_on_first_use  VARCHAR2(1);
    l_first_password_use_occurred   VARCHAR2(1);
BEGIN
  for i in (select * 
              from APEX_WORKSPACE_APEX_USERS 
            where WORKSPACE_NAME != 'INTERNAL' 
             and USER_NAME != 'ADMIN' 
             and ACCOUNT_LOCKED = 'No'
             and IS_ADMIN = 'No'
             and IS_APPLICATION_DEVELOPER = 'No') LOOP
    l_user_id := APEX_UTIL.GET_USER_ID(i.user_name);

    APEX_UTIL.FETCH_USER(
        p_user_id                       => l_user_id,
        p_workspace                     => l_workspace,
        p_user_name                     => l_user_name,
        p_first_name                    => l_first_name,
        p_last_name                     => l_last_name,
        p_web_password                  => l_web_password,
        p_email_address                 => l_email_address,
        p_start_date                    => l_start_date,
        p_end_date                      => l_end_date,
        p_employee_id                   => l_employee_id,
        p_allow_access_to_schemas       => l_allow_access_to_schemas,
        p_person_type                   => l_person_type,
        p_default_schema                => l_default_schema,
        p_groups                        => l_groups,
        p_developer_role                => l_developer_role,
        p_description                   => l_description,
        p_account_expiry                => l_account_expiry,
        p_account_locked                => l_account_locked,
        p_failed_access_attempts        => l_failed_access_attempts,
        p_change_password_on_first_use  => l_change_password_on_first_use,
        p_first_password_use_occurred   => l_first_password_use_occurred);
    APEX_UTIL.EDIT_USER (
        p_user_id                       => l_user_id,
        p_user_name                     => l_user_name,
        p_first_name                    => l_first_name,
        p_last_name                     => l_last_name,
        p_web_password                  => l_web_password,
        p_new_password                  => l_web_password,
        p_email_address                 => l_email_address,
        p_start_date                    => l_start_date,
        p_end_date                      => l_end_date,
        p_employee_id                   => l_employee_id,
        p_allow_access_to_schemas       => l_allow_access_to_schemas,
        p_person_type                   => l_person_type,
        p_default_schema                => l_default_schema,
        p_group_ids                     => l_groups,
        p_developer_roles               => l_developer_role,
        p_description                   => l_description,
        p_account_expiry                => l_account_expiry,
        p_account_locked                => l_account_locked,
        p_failed_access_attempts        => l_failed_access_attempts,
        p_change_password_on_first_use  => 'N',
        p_first_password_use_occurred   => 'Y');
        
   end loop;     
        
END;



