import socket

def start_udp_server():
    # Define the host and port
    host = '127.0.0.1'  # localhost
    port = 14560

    # Create a UDP socket
    udp_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

    # Bind the socket to the address and port
    udp_socket.bind((host, port))

    print(f"UDP server listening on {host}:{port}")

    try:
        while True:
            # Receive data from the client
            data, address = udp_socket.recvfrom(1024)
            
            # Decode the received data
            #message = data.decode('utf-8')

            # Display the received message and client address
            print('message received')
            #print(f"Received message from {address}: {message}")

    except KeyboardInterrupt:
        print("\nUDP server shutting down.")
    finally:
        # Close the socket when done
        udp_socket.close()

if __name__ == "__main__":
    start_udp_server()
