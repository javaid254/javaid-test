--
-- Add foreign keys for Asset Registry
--
ALTER TABLE assets
ADD FOREIGN KEY (asset_group_type_id) REFERENCES asset_group_types(asset_group_type_id),
ADD FOREIGN KEY (asset_location_address_id) REFERENCES asset_location_addresses(asset_location_address_id);

ALTER TABLE asset_attributes
ADD FOREIGN KEY (asset_id) REFERENCES assets(asset_id);

ALTER TABLE asset_alternative_names
ADD FOREIGN KEY (asset_id) REFERENCES assets(asset_id);

ALTER TABLE asset_location_gis
ADD FOREIGN KEY (asset_id) REFERENCES assets(asset_id);

ALTER TABLE asset_history
ADD FOREIGN KEY (asset_id) REFERENCES assets(asset_id);

ALTER TABLE asset_history_attributes
ADD FOREIGN KEY (asset_history_id) REFERENCES asset_history(asset_history_id);

ALTER TABLE asset_attachments
ADD FOREIGN KEY (asset_id) REFERENCES assets(asset_id);

ALTER TABLE asset_group_type_attachments
ADD FOREIGN KEY (asset_group_type_id) REFERENCES asset_group_types(asset_group_type_id);

ALTER TABLE defect_types
ADD FOREIGN KEY (asset_group_type_id) REFERENCES asset_group_types(asset_group_type_id);

ALTER TABLE defects
ADD FOREIGN KEY (asset_id) REFERENCES assets(asset_id),
ADD FOREIGN KEY (asset_group_type_id) REFERENCES asset_group_types(asset_group_type_id),
ADD FOREIGN KEY (defect_type_id) REFERENCES defect_types(defect_type_id);

ALTER TABLE work_order_tasks
ADD FOREIGN KEY (asset_id) REFERENCES assets(asset_id);

ALTER TABLE work_order_task_attributes
ADD FOREIGN KEY (work_order_task_id) REFERENCES work_order_tasks(work_order_task_id);

ALTER TABLE asset_nodes
ADD FOREIGN KEY (asset_id) REFERENCES assets(asset_id),
ADD FOREIGN KEY (asset_link_id) REFERENCES asset_links(asset_link_id);

ALTER TABLE asset_links
ADD FOREIGN KEY (asset_id) REFERENCES assets(asset_id),
ADD FOREIGN KEY (asset_node_id1) REFERENCES asset_nodes(asset_node_id),
ADD FOREIGN KEY (asset_node_id2) REFERENCES asset_nodes(asset_node_id);

ALTER TABLE asset_node_attributes
ADD FOREIGN KEY (asset_node_id) REFERENCES asset_nodes(asset_node_id);

ALTER TABLE asset_link_attributes
ADD FOREIGN KEY (asset_link_id) REFERENCES asset_links(asset_link_id);
