from fastapi import FastAPI, Request
import logging

app = FastAPI()

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

@app.middleware("http")
async def log_custom_header(request: Request, call_next):
	# Extract the custom header value
	custom_header_value = request.headers.get("X-Custom-Header", "Not Found")
	logger.info(f"X-Custom-Header: {custom_header_value}")
	
	response = await call_next(request)
	return response

@app.get("/")
def read_root():
	return {"Hello": "World"}

@app.get("/items/{item_id}")
def read_item(item_id: int, q: str = None):
	return {"item_id": item_id, "q": q}