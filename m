Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ec66ab09
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jun 2016 21:20:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 08da08d8
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jun 2016 21:20:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id eee85638
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jun 2016 21:20:58 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id q132so42230592lfe.3
 for <wireguard@lists.zx2c4.com>; Wed, 29 Jun 2016 14:23:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160629211921.GA6200@wolff.to>
References: <20160629202228.GA1993@wolff.to>
 <CAHmME9rSj3+4YB_x0HY26TvATSwL6+gNkjoH+SJCA6q3K-H63g@mail.gmail.com>
 <20160629205939.GA19300@wolff.to>
 <CAHmME9qwAtRseWo5yfTpcV6DWfXsYLj3tMigsb4Z+u=WGE4sWA@mail.gmail.com>
 <20160629210654.GA29966@wolff.to>
 <CAHmME9roH8Kvtt0VWN5aq3YH8LMG1oosPkg=pnZgzosLX=WBTg@mail.gmail.com>
 <20160629211921.GA6200@wolff.to>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 29 Jun 2016 23:23:40 +0200
Message-ID: <CAHmME9qz7cE-v_rzoc2iLasNFVM9wzfTwfErx-OrADPSJLTAmg@mail.gmail.com>
To: Bruno Wolff III <bruno@wolff.to>
Content-Type: text/plain; charset=UTF-8
Cc: wireguard@lists.zx2c4.com
Subject: Re: [WireGuard] wg doesn't build on 4.7 kernels
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, Jun 29, 2016 at 11:19 PM, Bruno Wolff III <bruno@wolff.to> wrote:
>
> It builds on x86_64 and i686 now. Thanks.
>
> I probably won't get a tunnel tested until tomorrow.


Wonderful. If you want to just quickly test whether things work at
all, there's the quick demo server script:

https://www.wireguard.io/quickstart/#demo-server

$ sudo contrib/client-server-example/client.sh
$ chromium http://192.168.4.1
$ ping 192.168.4.1
