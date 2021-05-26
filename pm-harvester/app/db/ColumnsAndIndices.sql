call AddColumnIfNotExists(
	'polymesh-harvester',
    'data_event',
    'event_arg_0',
    "varchar(100) GENERATED ALWAYS AS (attributes->>'$[0].value') STORED NULL AFTER `attributes`");

call AddColumnIfNotExists(
	'polymesh-harvester',
    'data_event',
    'event_arg_1',
    "varchar(100) GENERATED ALWAYS AS (attributes->>'$[1].value') STORED NULL AFTER `event_arg_0`");

call AddColumnIfNotExists(
	'polymesh-harvester',
    'data_event',
    'event_arg_2',
    "varchar(100) GENERATED ALWAYS AS (attributes->>'$[2].value') STORED NULL AFTER `event_arg_1`");

call AddColumnIfNotExists(
	'polymesh-harvester',
    'data_event',
    'event_arg_3',
    "varchar(100) GENERATED ALWAYS AS (attributes->>'$[3].value') STORED NULL AFTER `event_arg_2`");

call AddColumnIfNotExists(
	'polymesh-harvester',
    'data_event',
    'claim_type',
    "varchar(30) GENERATED ALWAYS AS (JSON_UNQUOTE(JSON_EXTRACT(JSON_KEYS(attributes, '$[1].value.claim'), '$[0]'))) STORED NULL AFTER `event_arg_3`");

call AddColumnIfNotExists(
	'polymesh-harvester',
    'data_event',
    'claim_scope',
    "varchar(100) GENERATED ALWAYS AS (
        CASE 
            WHEN JSON_UNQUOTE(JSON_EXTRACT(JSON_KEYS(attributes, '$[1].value.claim'), '$[0]')) = 'CustomerDueDiligence' THEN null
            WHEN JSON_UNQUOTE(JSON_EXTRACT(JSON_KEYS(attributes, '$[1].value.claim'), '$[0]')) = 'InvestorUniqueness' THEN JSON_OBJECT('type', JSON_EXTRACT(JSON_KEYS(JSON_EXTRACT(JSON_EXTRACT(attributes->>'$[1].value.claim[0].*', '$[0]'), '$.col1')), '$[0]'), 'value', JSON_EXTRACT(JSON_EXTRACT(JSON_EXTRACT(attributes->>'$[1].value.claim[0].*', '$[0]'), '$.col1.*'), '$[0]'))
            WHEN JSON_UNQUOTE(JSON_EXTRACT(JSON_KEYS(attributes, '$[1].value.claim'), '$[0]')) <> 'Jurisdiction' THEN JSON_OBJECT('type', JSON_EXTRACT(JSON_KEYS(JSON_EXTRACT(attributes->>'$[1].value.claim[0].*', '$[0]')), '$[0]'), 'value', JSON_EXTRACT(JSON_EXTRACT(attributes->>'$[1].value.claim[0].*', '$[0].*'), '$[0]'))
            ELSE JSON_OBJECT('type', JSON_EXTRACT(JSON_KEYS(JSON_EXTRACT(JSON_EXTRACT(attributes->>'$[1].value.claim[0].*', '$[0]'), '$.col2')), '$[0]'), 'value', JSON_EXTRACT(JSON_EXTRACT(JSON_EXTRACT(attributes->>'$[1].value.claim[0].*', '$[0]'), '$.col2.*'), '$[0]'))
        END) STORED NULL AFTER `claim_type`
    ");
            
call AddColumnIfNotExists(
	'polymesh-harvester',
    'data_event',
    'claim_issuer',
    "varchar(66) GENERATED ALWAYS AS (attributes->>'$[1].value.claim_issuer') STORED NULL AFTER `claim_scope`");
            
call AddColumnIfNotExists(
	'polymesh-harvester',
    'data_event',
    'claim_expiry',
    "varchar(15) GENERATED ALWAYS AS (
        CASE
            WHEN attributes->>'$[1].value.expiry' = 'null' THEN null
            ELSE attributes->>'$[1].value.expiry'
        END) STORED NULL AFTER `claim_issuer`");

call AddIndexIfNotExists(
	'polymesh-harvester',
    'data_event',
    'ix_data_event_event_arg_0',
    'event_arg_0');

call AddIndexIfNotExists(
	'polymesh-harvester',
    'data_event',
    'ix_data_event_event_arg_1',
    'event_arg_1');

call AddIndexIfNotExists(
	'polymesh-harvester',
    'data_event',
    'ix_data_event_event_arg_2',
    'event_arg_2');

call AddIndexIfNotExists(
	'polymesh-harvester',
    'data_event',
    'ix_data_event_event_arg_3',
    'event_arg_3');

call AddIndexIfNotExists(
	'polymesh-harvester',
    'data_event',
    'ix_data_event_claim_type',
    'claim_type');

call AddIndexIfNotExists(
	'polymesh-harvester',
    'data_event',
    'ix_data_event_claim_scope',
    'claim_scope');

call AddIndexIfNotExists(
	'polymesh-harvester',
    'data_event',
    'ix_data_event_claim_issuer',
    'claim_issuer');

call AddIndexIfNotExists(
	'polymesh-harvester',
    'data_event',
    'ix_data_event_spec_version_id',
    'spec_version_id');

call AddIndexIfNotExists(
	'polymesh-harvester',
    'data_event',
    'ix_data_event_module_id_event_id_event_arg_2',
    'module_id, event_id, event_arg_2');
