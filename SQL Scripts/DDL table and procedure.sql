
CREATE TABLE [dbo].[youtube_video_likes] (
  ITEM_ID            VARCHAR(100) NOT NULL,
  VIDEO_ID           VARCHAR(100) NOT NULL,
  LIKES              INT          NOT NULL,
  FULL_JSON_RESPONSE VARCHAR(MAX) NOT NULL,
  TS_INSERT          DATETIME     NOT NULL
)
WITH (DISTRIBUTION = ROUND_ROBIN, HEAP)
GO

CREATE PROC [dbo].[p_youtube_video_likes_insert] @p_item_id [VARCHAR](100), @p_video_id [varchar](100), @p_likes [INT], @p_full_json_response [VARCHAR](MAX) AS
BEGIN
    INSERT INTO [dbo].[youtube_video_likes](item_id, video_id, likes, full_json_response, ts_insert)
    SELECT @p_item_id, @p_video_id, @p_likes, @p_full_json_response, SYSDATETIME();
END
GO

