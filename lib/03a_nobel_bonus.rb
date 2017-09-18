# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

# BONUS PROBLEM: requires sub-queries or joins. Attempt this after completing
# sections 04 and 07.

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)

  -- SELECT yr
  -- FROM nobels
  -- GROUP BY yr
  -- HAVING
  -- COUNT('Physics') > 1 AND
  -- COUNT('Chemistry') IS NULL;
  SELECT yr
  FROM nobels
  GROUP BY yr
  HAVING
    COUNT(subject = 'Physics') > 0 AND
    COUNT(subject = 'Chemistry') = 0
  ORDER BY yr ASC
  ;

  SQL
end
