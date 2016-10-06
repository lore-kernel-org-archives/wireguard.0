Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d25829ff
 for <wireguard@lists.zx2c4.com>; Thu, 6 Oct 2016 20:31:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fdfb8cda
 for <wireguard@lists.zx2c4.com>; Thu, 6 Oct 2016 20:31:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4155228b
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 6 Oct 2016 20:31:54 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id b81so26434054lfe.1
 for <wireguard@lists.zx2c4.com>; Thu, 06 Oct 2016 13:43:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20161006192743.GA12972@wolff.to>
References: <1475719977.650386.747317105.1837502D@webmail.messagingengine.com>
 <20161006150310.GB30704@wolff.to>
 <CAHmME9qj9AARx7S6RsyCnWYN4fJizeHfgeqW4zmFtGahLs--pg@mail.gmail.com>
 <20161006192743.GA12972@wolff.to>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 6 Oct 2016 22:43:19 +0200
Message-ID: <CAHmME9q5-rvV73WFhMDvYvs7q2DKaOuZj8xZCvEbk-K_WARGdw@mail.gmail.com>
To: Bruno Wolff III <bruno@wolff.to>
Content-Type: multipart/alternative; boundary=94eb2c1a1a8637f888053e3858f7
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] auth-only wireguard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c1a1a8637f888053e3858f7
Content-Type: text/plain; charset=UTF-8

Hi Bruno,

On Oct 6, 2016 9:29 PM, "Bruno Wolff III" <bruno@wolff.to> wrote:
> Someone able to watch and modify traffic can wait for authentication to
occur and then take over the connection. So you don't know you are still
communicating with the party that did the authentication. You need
something protecting message integrity which is normally based on
encryption, but I think there might be ways to do that with just hashing.

You're misunderstanding terminology, I think. Rather than polluting this
thread here, I'd be happy to explain to you on IRC -- I'm zx2c4 on freenode.

Jason

--94eb2c1a1a8637f888053e3858f7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Hi Bruno,</p>
<p dir=3D"ltr">On Oct 6, 2016 9:29 PM, &quot;Bruno Wolff III&quot; &lt;<a h=
ref=3D"mailto:bruno@wolff.to">bruno@wolff.to</a>&gt; wrote:<br>
&gt; Someone able to watch and modify traffic can wait for authentication t=
o occur and then take over the connection. So you don&#39;t know you are st=
ill communicating with the party that did the authentication. You need some=
thing protecting message integrity which is normally based on encryption, b=
ut I think there might be ways to do that with just hashing.</p>
<p dir=3D"ltr">You&#39;re misunderstanding terminology, I think. Rather tha=
n polluting this thread here, I&#39;d be happy to explain to you on IRC -- =
I&#39;m zx2c4 on freenode.</p>
<p dir=3D"ltr">Jason</p>

--94eb2c1a1a8637f888053e3858f7--
