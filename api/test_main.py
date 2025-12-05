from fastapi.testclient import TestClient
from unittest.mock import patch, MagicMock 
import os
from main import app


os.environ["AWS_ACCESS_KEY"] = "test-key"
os.environ["AWS_SECRET_KEY"] = "test-secret"
os.environ["AWS_REGION"] = "us-east-1"
os.environ["S3_BUCKET_NAME"] = "test-bucket"

client = TestClient(app)

@patch('main.s3')
def test_generate_qr(mock_s3):
    mock_s3_instance = MagicMock()  
    mock_s3.return_value = mock_s3_instance 
    mock_s3_instance.put_object.return_value = None

    url = "http://example.com"
    response = client.post(f"/generate-qr/?url={url}")

    assert response.status_code == 200
    assert "qr_code_url" in response.json()


@patch('main.s3')
def test_generate_qr_invalid_url(mock_s3):
    mock_s3_instance = MagicMock()  
    mock_s3.return_value = mock_s3_instance 
    mock_s3_instance.put_object.return_value = None
    
    url = "invalid-url"
    response = client.post(f"/generate-qr/?url={url}")

    assert response.status_code == 200  # FastAPI validation error