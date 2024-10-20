require 'sinatra'
require 'google/apis/analyticsreporting_v4'
require 'googleauth'
require 'json'

SCOPES = ['https://www.googleapis.com/auth/analytics.readonly'].freeze

# อ่านไฟล์ credentials JSON จาก Google Cloud
CREDENTIALS_PATH = 'config/credentials.json' # เปลี่ยนพาธนี้ตามต้องการ

# ฟังก์ชันสำหรับดึงข้อมูล Google Analytics
def fetch_analytics_data(start_date, end_date)
  service = Google::Apis::AnalyticsreportingV4::AnalyticsReportingService.new

  # Authenticate ผ่าน Service Account
  authorizer = Google::Auth::ServiceAccountCredentials.make_creds(
    json_key_io: File.open(CREDENTIALS_PATH),
    scope: SCOPES
  )
  service.authorization = authorizer

  # สร้าง request สำหรับดึงข้อมูล
  request = Google::Apis::AnalyticsreportingV4::GetReportsRequest.new(
    report_requests: [
      {
        view_id: 'YOUR_VIEW_ID', # ใส่ View ID ของคุณที่ได้จาก Google Analytics
        date_ranges: [
          { start_date: start_date, end_date: end_date }
        ],
        metrics: [
          { expression: 'ga:sessions' },
          { expression: 'ga:pageviews' }
        ]
      }
    ]
  )

  # ดึงข้อมูลจาก Google Analytics
  response = service.batch_get_reports(request)
  return response
end

# Route สำหรับหน้าเว็บ
get '/' do
  erb :index
end

post '/analytics' do
  start_date = params[:start_date]
  end_date = params[:end_date]
  
  # ดึงข้อมูลจาก Google Analytics
  analytics_data = fetch_analytics_data(start_date, end_date)

  # ส่งข้อมูลไปยังหน้าเว็บ
  @sessions = analytics_data.reports.first.data.rows.first.metrics.first.values[0]
  @pageviews = analytics_data.reports.first.data.rows.first.metrics.first.values[1]

  erb :analytics
end
