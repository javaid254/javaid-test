--
-- Create tables for Asset Registry
--
CREATE TABLE asset_group_types
(
    asset_group_type_id character varying(36) NOT NULL,
    description character varying(255),
    last_modified_timestamp timestamp,
    last_modified_by  character varying(20),
    created_timestamp timestamp,
    created_by  character varying(20),
    CONSTRAINT asset_group_types_pkey PRIMARY KEY (asset_group_type_id)
);
ALTER TABLE asset_group_types
    OWNER to :user;
    
CREATE TABLE assets
(
    asset_id character varying(36) NOT NULL,
    asset_name character varying(20) NOT NULL,
    description character varying(255),
    asset_group_type_id character varying(36) NOT NULL,
    status character varying(20),
    parent_asset_id character varying(36),
    asset_location_address_id character varying(36),
    business_unit character varying(20) NOT NULL,
    asset_segment_from numeric,
    asset_segment_to numeric,
    segment_unit character varying(20),
    last_modified_timestamp timestamp,
    last_modified_by  character varying(20),
    created_timestamp timestamp,
    created_by  character varying(20),
    CONSTRAINT assets_pkey PRIMARY KEY (asset_id)
);
ALTER TABLE assets
    OWNER to :user;
    
CREATE TABLE asset_attributes
(
    asset_attribute_id character varying(36) NOT NULL,
    asset_id character varying(36) NOT NULL,
    type character varying(20) NOT NULL,
    name character varying(20) NOT NULL,
    value character varying(100),
    last_modified_timestamp timestamp,
    last_modified_by  character varying(20),
    created_timestamp timestamp,
    created_by  character varying(20),
    CONSTRAINT asset_attributes_pkey PRIMARY KEY (asset_attribute_id)
);
ALTER TABLE asset_attributes
    OWNER to :user;
    
CREATE TABLE asset_alternative_names
(
    asset_alternative_name_id character varying(36) NOT NULL,
    asset_id character varying(36) NOT NULL,
    type character varying(20) NOT NULL,
    name character varying(20) NOT NULL,
    description character varying(255),
    last_modified_timestamp timestamp,
    last_modified_by  character varying(20),
    created_timestamp timestamp,
    created_by  character varying(20),
    CONSTRAINT asset_alternative_names_pkey PRIMARY KEY (asset_alternative_name_id)
);
ALTER TABLE asset_alternative_names
    OWNER to :user;
    
CREATE TABLE asset_location_addresses
(
    asset_location_address_id character varying(36) NOT NULL,
    country character varying(20) NOT NULL,
    postcode character varying(10),
    state character varying(20),
    city character varying(20),
    street character varying(100),
    street_number character varying(10),
    building character varying(20),
    other character varying(100),
    description character varying(255),
    last_modified_timestamp timestamp,
    last_modified_by  character varying(20),
    created_timestamp timestamp,
    created_by  character varying(20),
    CONSTRAINT asset_location_addresses_pkey PRIMARY KEY (asset_location_address_id)
);
ALTER TABLE asset_location_addresses
    OWNER to :user;
    
CREATE TABLE asset_location_gis
(
    asset_location_gis_id character varying(36) NOT NULL,
    asset_id character varying(36) NOT NULL,
    asset_reference character varying(20) NOT NULL,
    type character varying(20) NOT NULL,
    reference_type character varying(20) NOT NULL,
    route_connection character varying(20),
    route_feature_class character varying(20),
    route_feature_id character varying(36),
    start_point point,
    end_point point,
    start_distance numeric,
    end_distance numeric,
    units character varying(20),
    last_modified_timestamp timestamp,
    last_modified_by  character varying(20),
    created_timestamp timestamp,
    created_by  character varying(20),
    CONSTRAINT asset_location_gis_pkey PRIMARY KEY (asset_location_gis_id)
);
ALTER TABLE asset_location_gis
    OWNER to :user;
    
CREATE TABLE asset_history
(
    asset_history_id character varying(36) NOT NULL,
    asset_id character varying(36) NOT NULL,
    asset_component character varying(20),
    asset_component_modifier character varying(20),
    type character varying(20) NOT NULL,
    last_modified_timestamp timestamp,
    last_modified_by  character varying(20),
    created_timestamp timestamp,
    created_by  character varying(20),
    CONSTRAINT asset_history_pkey PRIMARY KEY (asset_history_id)
);
ALTER TABLE asset_history
    OWNER to :user;
    
CREATE TABLE asset_history_attributes
(
    asset_history_attribute_id character varying(36) NOT NULL,
    asset_history_id character varying(36) NOT NULL,
    name character varying(20),
    value character varying(100) NOT NULL,
    last_modified_timestamp timestamp,
    last_modified_by  character varying(20),
    created_timestamp timestamp,
    created_by  character varying(20),
    CONSTRAINT asset_history_attributes_pkey PRIMARY KEY (asset_history_attribute_id)
);
ALTER TABLE asset_history_attributes
    OWNER to :user;
    
CREATE TABLE asset_attachments
(
    asset_attachment_id character varying(36) NOT NULL,
    asset_id character varying(36) NOT NULL,
    description character varying(255),
    url character varying(255) NOT NULL,
    last_modified_timestamp timestamp,
    last_modified_by  character varying(20),
    created_timestamp timestamp,
    created_by  character varying(20),
    CONSTRAINT asset_attachments_pkey PRIMARY KEY (asset_attachment_id)
);
ALTER TABLE asset_attachments
    OWNER to :user;
    
CREATE TABLE asset_group_type_attachments
(
    asset_group_type_attachment_id character varying(36) NOT NULL,
    asset_group_type_id character varying(36) NOT NULL,
    description character varying(255),
    url character varying(255) NOT NULL,
    last_modified_timestamp timestamp,
    last_modified_by  character varying(20),
    created_timestamp timestamp,
    created_by  character varying(20),
    CONSTRAINT asset_group_type_attachments_pkey PRIMARY KEY (asset_group_type_attachment_id)
);
ALTER TABLE asset_group_type_attachments
    OWNER to :user;
    
CREATE TABLE defect_types
(
    defect_type_id character varying(36) NOT NULL,
    asset_group_type_id character varying(36) NOT NULL,
    asset_component character varying(20),
    description character varying(20) NOT NULL,
    value_type character varying(20) NOT NULL,
    last_modified_timestamp timestamp,
    last_modified_by  character varying(20),
    created_timestamp timestamp,
    created_by  character varying(20),
    CONSTRAINT defect_types_pkey PRIMARY KEY (defect_type_id)
);
ALTER TABLE defect_types
    OWNER to :user;
    
CREATE TABLE defects
(
    defect_id character varying(36) NOT NULL,
    defect_type_id character varying(36) NOT NULL,
    asset_group_type_id character varying(36) NOT NULL,
    asset_component character varying(20),
    asset_component_modifer character varying(20),
    asset_id character varying(36) NOT NULL,
    value character varying(100),
    severity character varying(20),
    status character varying(20),
    priority_code character varying(20),
    defect_segment_from numeric,
    defect_segment_to numeric,
    action_work_order_task_id character varying(36),
    action_taken character varying(255),
    last_modified_timestamp timestamp,
    last_modified_by  character varying(20),
    created_timestamp timestamp,
    created_by  character varying(20),
    CONSTRAINT defects_pkey PRIMARY KEY (defect_id)
);
ALTER TABLE defects
    OWNER to :user;
    
CREATE TABLE defect_attributes
(
    defect_attribute_id character varying(36) NOT NULL,
    defect_id character varying(36) NOT NULL,
    name character varying(20),
    value character varying(100),
    last_modified_timestamp timestamp,
    last_modified_by  character varying(20),
    created_timestamp timestamp,
    created_by  character varying(20),
    CONSTRAINT defect_attributes_pkey PRIMARY KEY (defect_attribute_id)
);
ALTER TABLE defect_attributes
    OWNER to :user;
    
CREATE TABLE defect_location_gis
(
    defect_location_gis_id character varying(36) NOT NULL,
    defect_id character varying(36) NOT NULL,
    asset_reference character varying(20) NOT NULL,
    type character varying(20) NOT NULL,
    reference_type character varying(20) NOT NULL,
    route_connection character varying(20),
    route_feature_class character varying(20),
    route_feature_id character varying(36),
    start_point point,
    end_point point,
    start_distance numeric,
    end_distance numeric,
    units character varying(20),
    last_modified_timestamp timestamp,
    last_modified_by  character varying(20),
    created_timestamp timestamp,
    created_by  character varying(20),
    CONSTRAINT defect_location_gis_pkey PRIMARY KEY (defect_location_gis_id)
);
ALTER TABLE defect_location_gis
    OWNER to :user;
    
CREATE TABLE defect_attachments
(
    defect_attachment_id character varying(36) NOT NULL,
    defect_id character varying(36) NOT NULL,
    description character varying(255),
    url character varying(255) NOT NULL,
    last_modified_timestamp timestamp,
    last_modified_by  character varying(20),
    created_timestamp timestamp,
    created_by  character varying(20),
    CONSTRAINT defect_attachments_pkey PRIMARY KEY (defect_attachment_id)
);
ALTER TABLE defect_attachments
    OWNER to :user;
    
CREATE TABLE work_order_tasks
(
    work_order_task_id character varying(36) NOT NULL,
    work_group character varying(20) NOT NULL,
    asset_id character varying(36),
    assigned_to character varying(20),
    business_group character varying(20) NOT NULL,
    last_modified_timestamp timestamp,
    last_modified_by  character varying(20),
    created_timestamp timestamp,
    created_by  character varying(20),
    CONSTRAINT work_order_tasks_pkey PRIMARY KEY (work_order_task_id)
);
ALTER TABLE work_order_tasks
    OWNER to :user;
    
CREATE TABLE work_order_task_attributes
(
    work_order_task_attribute_id character varying(36) NOT NULL,
    work_order_task_id character varying(36) NOT NULL,
	type character varying(20) NOT NULL,
    name character varying(20),
    value character varying(100) NOT NULL,
    last_modified_timestamp timestamp,
    last_modified_by  character varying(20),
    created_timestamp timestamp,
    created_by  character varying(20),
    CONSTRAINT work_order_task_atttributes_pkey PRIMARY KEY (work_order_task_attribute_id)
);
ALTER TABLE work_order_task_attributes
    OWNER to :user;
    
CREATE TABLE asset_nodes
(
    asset_node_id character varying(36) NOT NULL,
    asset_id character varying(36),
    asset_link_id character varying(36) NOT NULL,
    type character varying(10) NOT NULL,
    last_modified_timestamp timestamp,
    last_modified_by  character varying(20),
    created_timestamp timestamp,
    created_by  character varying(20),
    CONSTRAINT asset_nodes_pkey PRIMARY KEY (asset_node_id)
);
ALTER TABLE asset_nodes
    OWNER to :user;
    
CREATE TABLE asset_links
(
    asset_link_id character varying(36) NOT NULL,
    asset_node_id1 character varying(36) NOT NULL,
    asset_node_id2 character varying(36) NOT NULL,
    asset_id character varying(36),
    link_route lseg,
    last_modified_timestamp timestamp,
    last_modified_by  character varying(20),
    created_timestamp timestamp,
    created_by  character varying(20),
    CONSTRAINT asset_links_pkey PRIMARY KEY (asset_link_id)
);
ALTER TABLE asset_links
    OWNER to :user;
    
CREATE TABLE asset_node_attributes
(
    asset_node_attribute_id character varying(36) NOT NULL,
    asset_node_id character varying(36) NOT NULL,
    name character varying(20) NOT NULL,
    value character varying(100) NOT NULL,
    units character varying(20),
    node_location point,
    last_modified_timestamp timestamp,
    last_modified_by  character varying(20),
    created_timestamp timestamp,
    created_by  character varying(20),
    CONSTRAINT asset_node_attributes_pkey PRIMARY KEY (asset_node_attribute_id)
);
ALTER TABLE asset_node_attributes
    OWNER to :user;
    
CREATE TABLE asset_link_attributes
(
    asset_link_attribute_id character varying(36) NOT NULL,
    asset_link_id character varying(36) NOT NULL,
    name character varying(20) NOT NULL,
    value character varying(100) NOT NULL,
    units character varying(20),
    last_modified_timestamp timestamp,
    last_modified_by  character varying(20),
    created_timestamp timestamp,
    created_by  character varying(20),
    CONSTRAINT asset_link_attributes_pkey PRIMARY KEY (asset_link_attribute_id)
);
ALTER TABLE asset_link_attributes
    OWNER to :user;
