CREATE VIEW v_nom_mere AS  select nom from mere ;
CREATE VIEW v_nom_pere AS  select nom from pere ;
CREATE VIEW v_telephone AS select telephone from mere union select telephone from pere;