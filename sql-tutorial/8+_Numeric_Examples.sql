SELECT a_strongly_agree
FROM nss
WHERE question = 'Q01'
AND institution = 'Edinburgh Napier University'
AND subject = '(8) Computer Science';

SELECT institution, subject
  FROM nss
 WHERE question='Q15'
   AND score >= 100;

SELECT institution, score
  FROM nss
 WHERE question='Q15'
   AND score < 50
   AND subject='(8) Computer Science';

SELECT subject, SUM(response)
  FROM nss
 WHERE question='Q22'
   AND (subject='(8) Computer Science' OR subject='(H) Creative Arts and Design')
GROUP BY subject;

SELECT subject, SUM((response * A_STRONGLY_AGREE) / 100)
  FROM nss
WHERE question = 'Q22'
AND (subject = '(8) Computer Science' OR subject = '(H) Creative Arts and Design')
GROUP BY 1;

SELECT subject, ROUND(SUM(A_STRONGLY_AGREE * response) / SUM(response))
FROM nss
WHERE question='Q22'
AND subject IN ('(8) Computer Science',
                    '(H) Creative Arts and Design')
GROUP BY subject;

SELECT institution, ROUND(SUM(score * response) / SUM(response))
FROM nss
WHERE question='Q22'
AND institution LIKE '%Manchester%'
GROUP BY institution;

SELECT institution, SUM(sample) sample_size, 
    SUM(CASE WHEN subject = '(8) Computer Science' THEN sample ELSE 0 END) comp
FROM nss
WHERE institution LIKE '%Manchester%'
AND question = 'Q01'
GROUP BY institution;