Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4e89759c
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Nov 2017 17:30:37 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1a49a1ab
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Nov 2017 17:30:37 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c169c43c
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Nov 2017 17:30:37 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4971b527
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Nov 2017 17:30:37 +0000 (UTC)
Received: by mail-ot0-f173.google.com with SMTP id b54so24897467otd.8
 for <wireguard@lists.zx2c4.com>; Mon, 27 Nov 2017 09:36:24 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171127173354.GA17685@wolff.to>
References: <20171127094931.GA3104@wolff.to>
 <CAHmME9q+giuOXVz1=hE-F34vFMP0GxzveMzLbzrjeXbbjnrGCQ@mail.gmail.com>
 <20171127134914.GA9392@wolff.to> <20171127173354.GA17685@wolff.to>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 27 Nov 2017 18:36:23 +0100
Message-ID: <CAHmME9rq+eaLMZP+a1OAcu1=65X7Q_PrsMNBwAm7U2HaNWfUVQ@mail.gmail.com>
Subject: Re: Should I expect faster recovery after one side goes down
To: Bruno Wolff III <bruno@wolff.to>
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

Hello Bruno,

That's some pretty weird behavior, and it sounds like whatever the
cause is is being obscured under layers of systemd. Perhaps come on
into #wireguard on Freenode and we can debug this in real time? I've
got a few ideas.

Jason
