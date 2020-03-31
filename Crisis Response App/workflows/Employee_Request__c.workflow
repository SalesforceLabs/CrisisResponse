<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>NotifyDeniedTravel</fullName>
        <description>NotifyDeniedTravel</description>
        <protected>false</protected>
        <recipients>
            <field>Person_E_Mail_Address_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Crisis_Response_App/Travel_Request_Denied</template>
    </alerts>
    <alerts>
        <fullName>NotifyOfApproved</fullName>
        <description>NotifyOfApproved</description>
        <protected>false</protected>
        <recipients>
            <field>Person_E_Mail_Address_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Crisis_Response_App/Travel_Request_Approved</template>
    </alerts>
    <alerts>
        <fullName>Notify_Denied_Person</fullName>
        <description>Notify Denied Person</description>
        <protected>false</protected>
        <recipients>
            <field>Person_E_Mail_Address_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Crisis_Response_App/Employee_Request_Denied</template>
    </alerts>
    <alerts>
        <fullName>Notify_Person</fullName>
        <description>Notify Person</description>
        <protected>false</protected>
        <recipients>
            <field>Person_E_Mail_Address_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Crisis_Response_App/Employee_Request_Approved</template>
    </alerts>
    <fieldUpdates>
        <fullName>Approved_Date</fullName>
        <field>Date_Approved__c</field>
        <formula>today()</formula>
        <name>Approved Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approved_Field</fullName>
        <field>Approved__c</field>
        <literalValue>1</literalValue>
        <name>Approved Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Status_Denied</fullName>
        <field>Status__c</field>
        <literalValue>Denied</literalValue>
        <name>Update Denied Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_status</fullName>
        <field>Status__c</field>
        <literalValue>Approved</literalValue>
        <name>Update status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
</Workflow>
