Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8e53215
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jun 2016 00:38:29 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6c03b195
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jun 2016 00:38:29 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fffa0db8
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jun 2016 00:38:29 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id l188so44532215lfe.2
 for <wireguard@lists.zx2c4.com>; Wed, 29 Jun 2016 17:41:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160630000617.GA32601@wolff.to>
References: <20160629202228.GA1993@wolff.to>
 <CAHmME9rSj3+4YB_x0HY26TvATSwL6+gNkjoH+SJCA6q3K-H63g@mail.gmail.com>
 <20160629205939.GA19300@wolff.to>
 <CAHmME9qwAtRseWo5yfTpcV6DWfXsYLj3tMigsb4Z+u=WGE4sWA@mail.gmail.com>
 <20160629210654.GA29966@wolff.to>
 <CAHmME9roH8Kvtt0VWN5aq3YH8LMG1oosPkg=pnZgzosLX=WBTg@mail.gmail.com>
 <20160629211921.GA6200@wolff.to> <20160630000617.GA32601@wolff.to>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 30 Jun 2016 02:41:11 +0200
Message-ID: <CAHmME9q==ys0eaiZtSV67cF7FP0T5Zfe=fomY=9x6R40Xdz8bg@mail.gmail.com>
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

On Thu, Jun 30, 2016 at 2:06 AM, Bruno Wolff III <bruno@wolff.to> wrote:
> I got it tested, and it appears to be working fine. I am able to run ssh
> across the tunnel.

Great to hear!
