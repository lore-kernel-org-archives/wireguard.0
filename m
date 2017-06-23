Return-Path: tcondeixa@veniamworks.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 31dd0949
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Jun 2017 16:48:44 +0000 (UTC)
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
 [209.85.128.171])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0e8c1bec
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Jun 2017 16:48:44 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id r103so73950204wrb.0
 for <wireguard@lists.zx2c4.com>; Fri, 23 Jun 2017 10:04:46 -0700 (PDT)
Return-Path: <tcondeixa@veniamworks.com>
Received: from [192.168.0.64] ([213.58.201.38])
 by smtp.gmail.com with ESMTPSA id v2sm6129642wrb.68.2017.06.23.10.04.44
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Jun 2017 10:04:44 -0700 (PDT)
From: Tiago Condeixa <tcondeixa@veniamworks.com>
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Wireguard multihomed roaming performance
Message-Id: <EE8741B3-9787-4522-98B9-D484C4BE7A8E@veniamworks.com>
Date: Fri, 23 Jun 2017 18:04:44 +0100
To: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Janson,

I have using wireguard in a multihomed scenarios with a board equipped =
with WiFi and LTE.=20
In order to change the interface to be used I just change the route to =
the IP address of the wireguard server, but sometimes it take some time =
to update the endpoint in the server.=20
I was doing a analysis and the problem is not related with wireguard =
server but with the client. Sometimes the client takes a lot of seconds =
to change the IP source address of the wireguard tunnel and it has a =
great impact on handover time.=20
How are you adjusting the IP source address of the tunnel? do you have a =
cache that is periodically update or based on timeout? I have been =
thinking in adding a method for wg(8) that can allow me to change the IP =
source address of the tunnel when I want to roam between =
technologies/interfaces or do you have any better idea?

thank you,
Tiago=
