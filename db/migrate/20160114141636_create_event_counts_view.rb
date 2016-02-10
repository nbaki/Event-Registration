class CreateEventCountsView < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE OR REPLACE VIEW event_stats AS
      SELECT
      r.year,
      count(CASE WHEN s.status = 'Registered' THEN 1 END) num_registered,
      count(CASE when s.status = 'Waitlisted' THEN 1 END) num_waitlisted,
      count(CASE when s.status in ('Registered', 'Waitlisted') THEN 1 END) num_total
      FROM event_ref r
      LEFT OUTER JOIN registrants p ON r.year = p.year
      left outer join status s on p.id = s.registrant_id
      GROUP BY r.YEAR
    SQL
  end

  def down
    execute <<-SQL
      DROP VIEW event_stats
    SQL
  end
end
