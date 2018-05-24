Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a478deb1
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 May 2018 14:00:10 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 55907019
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 May 2018 14:00:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f35fb14
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 May 2018 13:58:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b1360f0b
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 May 2018 13:58:55 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id w123-v6so1535708oia.4
 for <wireguard@lists.zx2c4.com>; Thu, 24 May 2018 07:01:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1527135367.1083058.1382934352.4E96D38A@webmail.messagingengine.com>
References: <1527119825.1012882.1382673952.168165E8@webmail.messagingengine.com>
 <1527135367.1083058.1382934352.4E96D38A@webmail.messagingengine.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 24 May 2018 16:01:27 +0200
Message-ID: <CAHmME9pMHQ0hjbZ35sf7d1NQkuOJxwHRhEwJ5PdOP98epmmWWQ@mail.gmail.com>
Subject: Re: [wireguard-android] 'roaming' from LTE to WiFi with version
 0.0.20180523
To: nnet <nnet@fastmail.fm>
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

Hey Nnet,

On Thu, May 24, 2018 at 6:16 AM, nnet <nnet@fastmail.fm> wrote:
> Interestingly it's trying to send out to an IPv6 address. The peer endpoint IP is IPv4 only (the LTE is IPv4-in-6).

Great observation. I thought I had tried to squash those bugs, but
there may in fact be work still to do. You snipped the IP from the
log, so that makes it harder for me to be confident in this hunch, but
could you confirm something for me? Did those IPs begin with
"::ffff:[somethingelse]"?

Thanks,
Jason
