using myfirst.demo as sc from '../db/schema';

service Employeeserv {

    @odata.draft.enabled
    entity employee as select from sc.employee;

    entity Department as select from sc.Department;
}

annotate Employeeserv.employee with @(
  UI: {

    /* ========== List Report Columns ========== */
    LineItem: [
      {
        $Type : 'UI.DataField',
        Value : Name
      },
      {
        $Type : 'UI.DataField',
        Value : email_id
      },
      {
        $Type : 'UI.DataField',
        Value : dept
      }
    ],

    /* ========== Object Page Field Group ========== */
    FieldGroup #BasicData : {
      $Type : 'UI.FieldGroupType',
      Data : [
        {
          $Type : 'UI.DataField',
          Value : Name,
          Label : 'Name'
        },
        {
          $Type : 'UI.DataField',
          Value : eamil_id,
          Label : 'Email ID'
        },
        {
          $Type : 'UI.DataField',
          Value : dept,
          Label : 'Department'
        }
      ]
    },
    FieldGroup #AdditionalInfo : {
  $Type : 'UI.FieldGroupType',
  Data : [
    { $Type : 'UI.DataField', Value : createdBy,  Label : 'Created By' },
    { $Type : 'UI.DataField', Value : createdAt,  Label : 'Created On' },
    { $Type : 'UI.DataField', Value : modifiedBy, Label : 'Modified By' },
    { $Type : 'UI.DataField', Value : modifiedAt, Label : 'Modified On' }
  ]
},
    /* ========== Object Page Facets ========== */
    Facets : [
      {
        $Type  : 'UI.ReferenceFacet',
        Label  : 'Employee Basic Information',
        Target : '@UI.FieldGroup#BasicData'
      },
      
{
    $Type  : 'UI.ReferenceFacet',
    Label  : 'Additional Information',
    Target : '@UI.FieldGroup#AdditionalInfo'
  }

    ]

  }
);