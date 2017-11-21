Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e78ccd60
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 14:10:24 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8996e77d
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 14:10:24 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a316bc3
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 14:10:24 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e7e85cd9
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 14:10:23 +0000 (UTC)
Received: by mail-ot0-f170.google.com with SMTP id u10so10617871otc.12
 for <wireguard@lists.zx2c4.com>; Tue, 21 Nov 2017 06:15:23 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAC6SzH+Q-1SRVXOoScGhXWraOLdp9_Rud6cMbQ95a51r=eRWTw@mail.gmail.com>
References: <CAC6SzH+Q-1SRVXOoScGhXWraOLdp9_Rud6cMbQ95a51r=eRWTw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 21 Nov 2017 15:15:22 +0100
Message-ID: <CAHmME9piZhSukf55XY1Un2hO0TZyfHRh+afU8kk6R6yoSA5pQA@mail.gmail.com>
Subject: Re: multi-home difficulty
To: d tbsky <tbskyd@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue, Nov 21, 2017 at 2:21 PM, d tbsky <tbskyd@gmail.com> wrote:
> so at first client  2.2.2.2:51820 connect to server 1.1.1.1:51820
> but then server use 172.18.1.254(lan ip address) to reply and 51820
> port is nat to 1085 so the communication is broken.

The server should use 1.1.1.1 to reply. If it's not, that's a bug that
I should fix. Can you give me a minimal configuration for reproducing
this setup, so that I can fix whatever issue is occurring?

Thanks,
Jason
