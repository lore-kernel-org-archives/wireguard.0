Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7adc6a50
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 17:46:51 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ad4df3b0
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 17:46:51 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 72422d79
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 17:46:51 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id h129so32205995lfh.1
 for <wireguard@lists.zx2c4.com>; Fri, 08 Jul 2016 10:47:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAA5ikozCC91ZtVPyh5Z7tEc6pZ+AktguYc9qTn6bnZPSqEpK0A@mail.gmail.com>
References: <CAA5ikozfeQAFGx8Yi9d=1r5gkHNnq6e0yHFVLXHdVYD_V_Wwfg@mail.gmail.com>
 <CAHmME9oN9NU8fHTjfW6ougLf4u9ZfUHJ11MxDf3RhbC5n64g3g@mail.gmail.com>
 <CAA5ikozn+uj+FPG1eLAR9uS+Lxqiab4+dMUhmBmyg9oBiWFQEg@mail.gmail.com>
 <20160707131324.GA18014@lud.polynome.dn42>
 <CAA5ikoypGoMip+DS=Ud-dNRZOf-8m+MDtV5JobLr1MBmAdRS=A@mail.gmail.com>
 <20160707150059.GA679@wolff.to>
 <CAHmME9pcKkjmYgdgH6i3vGbd8iFxOaJDUsbczCU068sZk_pTuQ@mail.gmail.com>
 <CAA5ikozCC91ZtVPyh5Z7tEc6pZ+AktguYc9qTn6bnZPSqEpK0A@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 8 Jul 2016 19:47:10 +0200
Message-ID: <CAHmME9oy5OqRFF4b2uRtTf3JLTD-3Y6pG7hTKDpouSyVdJDfzw@mail.gmail.com>
To: Jan De Landtsheer <jan@incubaid.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Client changes endpoint port, why?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jan,

Have you tried this with the latest snapshot I published today? It
should fix your problem. For the boxes that are behind NAT, set
'PersistentKeepAlive = 25'. See the new manpage and the /quickstart/
blurb on the website. Alternatively, check out the [ANNOUNCE] release
notes on the mailing list from today.

Regards,
Jason
