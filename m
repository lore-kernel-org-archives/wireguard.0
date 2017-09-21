Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd13cc74
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 11:27:24 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e355b88
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 11:27:24 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 06066f70
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 11:46:27 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d5752d74
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 11:46:27 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id m103so10122249iod.13
 for <wireguard@lists.zx2c4.com>; Thu, 21 Sep 2017 04:54:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CADdae-jaxO+P-fcqgqjDRWkih4YhxS__A=weDtHVhB3j4R6W_A@mail.gmail.com>
References: <CADdae-hcrAL6-pMPwVOmGe3cb299jtUj68WVbz3EU5MmGQbtaQ@mail.gmail.com>
 <CAHmME9oMQ+3yUA8Da-m8YAkNgJ-aJ3uRuhp-uHJq_mRQ1hJDDQ@mail.gmail.com>
 <CADdae-jaxO+P-fcqgqjDRWkih4YhxS__A=weDtHVhB3j4R6W_A@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 21 Sep 2017 13:54:45 +0200
Message-ID: <CAHmME9o8E0r9jcQZgUd_dWF34VhykZkUr2-Q4tSrN+JUMyMG=g@mail.gmail.com>
Subject: Re: [wireguard-dev] Ability to use one udp port for multiple wg
 interfaces
To: nicolas prochazka <prochazka.nicolas@gmail.com>
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

On Thu, Sep 21, 2017 at 1:46 PM, nicolas prochazka
<prochazka.nicolas@gmail.com> wrote:
> at this moment, only one interface wg0  manage all peers and all
> customers , it's very complicating for the administrive tasks , qos,
> client separation ....

It should be possible to accomplish these administrative tasks and qos
via subnet range rather than interface. Each interface will handle up
to 2^20 peers, which should certainly be enough.

In any case, if you would like to use different interfaces, you'll
need to use different ports.
