class Statistic < ActiveRecord::Base
  def getPrecision(fname)
    selectStatement = """SELECT count(p.id) as numSamples,
                          sum(case when p.is_correct='t' then 1 else 0 end) as numCorrect, 
                          sum(case when p.is_correct='f' then 1 else 0 end) as numWrong, 
                          avg(case when p.is_correct='t' then 1 else 0 end) as percWrong, 
                          p.session_id as session_id
                        FROM precision_inputs as p 
                        WHERE p.statistic_id=#{self.id} and p.field_name=\"#{fname}\" and (p.is_correct is not NULL)
                        Group By p.session_id"""


    precInputs = PrecisionInput.find_by_sql(selectStatement).delete_if {|item| item["numSamples"]<10}
    return precInputs
  end

end



