/* Queries that have highest frequency of execution */
SELECT query AS qry,
    interval '1 millisecond' * total_time AS exec_time,
    to_char(
        (total_time / sum(total_time) OVER()) * 100,
        'FM90D0'
    ) || '%%' AS prop_exec_time,
    to_char(calls, 'FM999G999G990') AS ncalls,
    interval '1 millisecond' * (blk_read_time + blk_write_time) AS sync_io_time
FROM pg_stat_statements
WHERE userid = (
        SELECT usesysid
        FROM pg_user
        WHERE usename = current_user
        LIMIT 1
    )
ORDER BY calls DESC
LIMIT 10;