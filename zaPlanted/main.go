package main

import (
	"context"
	"log"
	"net"

	"google.golang.org/grpc"
	proto "google.golang.org/grpc/examples/planted/zaPlantedProto"
)

const (
	port = ":50051"
)

type Server struct {
	proto.UnimplementedBroadcastServer
}

func (s *Server) GetSlogan(ctx context.Context, in *proto.Meat) (*proto.Message, error) {
	log.Printf("Recieved: %v", in.GetMeat())
	var slogan string

	if in.GetMeat() == "chicken" {
		slogan = "Like chicken. Only better."
	} else if in.GetMeat() == "pulled" {
		slogan = "First, it's delicious. Second, it's sustainable."
	} else if in.GetMeat() == "kebab" {
		slogan = "The reinvention of the kebab."
	} else if in.GetMeat() == "schnitzel" {
		slogan = "Saving the climate. No pig deal.."
	} else {
		slogan = "No such meat!"
	}

	return &proto.Message{Slogan: slogan}, nil
}

func main() {
	lis, err := net.Listen("tcp", port)
	if err != nil {
		log.Fatalf("Failed to listen %v", err)
	}

	s := grpc.NewServer()
	proto.RegisterBroadcastServer(s, &Server{})
	log.Printf("Server lisrtening at %v", lis.Addr())
	if err := s.Serve(lis); err != nil {
		log.Fatalf("Failed to serve: %v", err)
	}
}
