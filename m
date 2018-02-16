Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4e60f691
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Feb 2018 05:24:28 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e59a8b10
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Feb 2018 05:24:28 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 33d7d559
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Feb 2018 05:15:36 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2920f298
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Feb 2018 05:15:36 +0000 (UTC)
Received: by mail-ot0-f182.google.com with SMTP id q12so1811254otg.10
 for <wireguard@lists.zx2c4.com>; Thu, 15 Feb 2018 21:31:32 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4bQ1XlXd3ErIjCR3iQzp_qIlD9TBA7puQAuFeLekYWn2gq_cLvljPmZ2jprtiMJb7jWDysgW6QlCEog92tofkegIis83aDQpPFhqW5H_81c=@protonmail.com>
References: <4bQ1XlXd3ErIjCR3iQzp_qIlD9TBA7puQAuFeLekYWn2gq_cLvljPmZ2jprtiMJb7jWDysgW6QlCEog92tofkegIis83aDQpPFhqW5H_81c=@protonmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 16 Feb 2018 06:31:31 +0100
Message-ID: <CAHmME9oZT+6ZpGETxp+_GQSTVB-a8BihEbC8YmcgXabDbGMx3A@mail.gmail.com>
Subject: Re: Retrict Docker Container To VPN
To: Benni Laib <benny.laib@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Benni,

You're probably looking for this document:
https://www.wireguard.com/netns/

Basically you do this:

# ip link add wg0 type wireguard
# ip link set wg0 netns PID

Where "PID" is the PID of any process running in that Docker
container. After that, you'll be able to see wg0 inside the Docker
container, but not in the host. The only traffic that will leave the
Docker container will then be encrypted packets sent to peer
endpoints.

Jason
