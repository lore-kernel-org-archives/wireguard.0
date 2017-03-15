Return-Path: ygh@mysterious.site
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 33d38012
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Mar 2017 03:22:02 +0000 (UTC)
Received: from sender-of-o52.zoho.com (sender-of-o52.zoho.com [135.84.80.217])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cc9450b9
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Mar 2017 03:22:02 +0000 (UTC)
Date: Wed, 15 Mar 2017 12:25:29 +0900
From: sopium <sopium@mysterious.site>
To: "wireguard" <wireguard@lists.zx2c4.com>
Message-ID: <15acfffc263.e11103bb85901.2506936173902453879@mysterious.site>
In-Reply-To: 
Subject: Some questions about the protocol
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

These are some questions about some corner cases and details of
the protocol, that the paper does not seem to clearly specify:

* Do we send cookie reply messages in response to handshake
  _response_ messages? My guess is YES? The figure in 5.4.1 only
  shows the case that the responder chooses to reply with a
  cookie message.

* Shall we start handshake in case the _previous_ session is not
  alive, or too old? My guess is NO?

* When padding packets, how to avoid getting larger than MTU,
  because we don't seem to know the MTU?

* When we receive a valid handshake init message, a secure
  transport is session is created. Do we start sending with this
  session immediately, in case there is still a valid previous
  session? Because if the handshake response we send is lost, the
  peer won't be able to decrypt our transport messages. The
  problem should eventually go away, but the peer may experience
  a brief blackout.

  So, shall we wait until successfully receiving a transport
  message with the new session, before start sending with
  it? (When the previous session is still valid, of course.)

Regards,
Sopium
