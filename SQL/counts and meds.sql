 select 
            e.date_start,
            m.name,
            ec.wbc,
            ec.hgb,
            ec.plt,
            ec.gran_percent,
            ec.anc
        from `event` e
        left join event_cbc ec on e.event_id = ec.event_id
        left join event_medication em on e.event_id = em.event_id
        left join medication m on em.medication_id = m.medication_id
        order by e.date_start;