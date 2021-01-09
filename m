Return-Path: <SRS0=fpOe=GM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F3D9C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  9 Jan 2021 10:50:32 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34F4D23A1E
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  9 Jan 2021 10:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34F4D23A1E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=urlichs.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2a7f2b15;
	Sat, 9 Jan 2021 10:50:29 +0000 (UTC)
Received: from netz.smurf.noris.de (dispatch.smurf.noris.de
 [2001:780:107:b::b])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8bca2d5a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.Com>; Sat, 9 Jan 2021 10:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=urlichs.de; 
 s=20160512;
 h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:
 References:To:Subject:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=QELgngHJ5ZgZmeKF5/zxBKy296rSczNioQyyuW3mC9w=; b=CApu1sVow45sMP71ePE7VfTA1V
 NdBaavbKTUz/QphaZrCUxxOrpjUBTLR2NtEyZBh7nK91djTzm3CFqETwwz3mauQZVMJl+EcVVq6GJ
 rxyfHynkDCBoUygaKlMpU7IeF4bF6DhYOR+ziDtCwspaXlDjad+cbvAJtdcMXsQdcwcaj8DK64zrf
 HfcR2S1hsyCT09rw5mQ7OyJgHElX59NsM7oNUDv4NcdTy4FTGXCw27q5OwMPkAzzR6v0VBHA0eDLJ
 Mo6Bo41sb00ySeQZE3Q2nr6fnVla2F16g0UQlsGOIlgAdsLUA0cDSfUV0XaC+cF4OcJSsX6/M/3xT
 fVmx6aUnjgJHvhaSZ7jSDOoDpIcYwbCQsij76BAenz4YKA0HF153Z8O9dEOS/QykfpLX5Juz1qXSP
 ZaGVsKul4gnOJMSGtZOIBlG+QDWtx43uhbdIMVAcKRzbYFTToWdoY+FBQ4457+nvutLNQYMwBmvGK
 5CQGLqKKm+CqAi7eXJEE4amhlUK5hvlReOHQtCrKVwOEvX88KDeznNlRVTVIkrymMAkuLGlVw/Rqe
 vMNPWXQl6ozYqAKElI5TMrbTKuxeh1W/nlkMfh2sU4vzxsbR7nS7CO/7Cr3I9W9RRjGbgYNBXyiyH
 +dFilkPNAbvx5SXf41KbmN1+XfeuZeMM941mholt8=;
Received: from asi.s.smurf.noris.de ([2001:780:107:200::a])
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <matthias@urlichs.de>) id 1kyBoI-00027Z-R6
 for wireguard@lists.zx2c4.com; Sat, 09 Jan 2021 11:49:30 +0100
Subject: Re: UBSAN: object-size-mismatch in wg_xmit
To: wireguard@lists.zx2c4.com
References: <000000000000e13e2905b6e830bb@google.com>
 <CAHmME9qwbB7kbD=1sg_81=82vO07XMV7GyqBcCoC=zwM-v47HQ@mail.gmail.com>
 <CACT4Y+ac8oFk1Sink0a6VLUiCENTOXgzqmkuHgQLcS2HhJeq=g@mail.gmail.com>
 <CAHmME9q0HMz+nERjoT-TQ8_6bcAFUNVHDEeXQAennUrrifKESw@mail.gmail.com>
 <CACT4Y+bKvf5paRS4X1QrcKZWfvtUi6ShP4i3y5NukRpQj0p1+Q@mail.gmail.com>
 <CAHmME9oOeMLARNsxzW0dvNT7Qz-EieeBSJP6Me5BWvjheEVysw@mail.gmail.com>
 <CACT4Y+Y9H4xB_4sS9Hu6e+u=tmYXcw6PFB0LY4FRuGQ6HCywrA@mail.gmail.com>
 <CAGXu5j+jzmkiU_AWoTVF6e263iYSSJYUHB=Kdqh-MCfEO-aNSg@mail.gmail.com>
 <CACT4Y+b1nmsQBx=dD=Q9_y_GZx1PpqTbzR6j=u5UecQ0JLyMFg@mail.gmail.com>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <3af10c88-e2a0-2909-439d-d58d07f60e0c@urlichs.de>
Date: Sat, 9 Jan 2021 11:49:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CACT4Y+b1nmsQBx=dD=Q9_y_GZx1PpqTbzR6j=u5UecQ0JLyMFg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="LKI9QKqMWdzbWwlBU64H5LWH5sCzYVe6n"
X-Smurf-Spam-Score: 0.0 (/)
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LKI9QKqMWdzbWwlBU64H5LWH5sCzYVe6n
Content-Type: multipart/mixed; boundary="ms6n9iWlUOUhmzHtHigJYM8VEIlHGt53t";
 protected-headers="v1"
From: Matthias Urlichs <matthias@urlichs.de>
To: wireguard@lists.zx2c4.com
Message-ID: <3af10c88-e2a0-2909-439d-d58d07f60e0c@urlichs.de>
Subject: Re: UBSAN: object-size-mismatch in wg_xmit
References: <000000000000e13e2905b6e830bb@google.com>
 <CAHmME9qwbB7kbD=1sg_81=82vO07XMV7GyqBcCoC=zwM-v47HQ@mail.gmail.com>
 <CACT4Y+ac8oFk1Sink0a6VLUiCENTOXgzqmkuHgQLcS2HhJeq=g@mail.gmail.com>
 <CAHmME9q0HMz+nERjoT-TQ8_6bcAFUNVHDEeXQAennUrrifKESw@mail.gmail.com>
 <CACT4Y+bKvf5paRS4X1QrcKZWfvtUi6ShP4i3y5NukRpQj0p1+Q@mail.gmail.com>
 <CAHmME9oOeMLARNsxzW0dvNT7Qz-EieeBSJP6Me5BWvjheEVysw@mail.gmail.com>
 <CACT4Y+Y9H4xB_4sS9Hu6e+u=tmYXcw6PFB0LY4FRuGQ6HCywrA@mail.gmail.com>
 <CAGXu5j+jzmkiU_AWoTVF6e263iYSSJYUHB=Kdqh-MCfEO-aNSg@mail.gmail.com>
 <CACT4Y+b1nmsQBx=dD=Q9_y_GZx1PpqTbzR6j=u5UecQ0JLyMFg@mail.gmail.com>
In-Reply-To: <CACT4Y+b1nmsQBx=dD=Q9_y_GZx1PpqTbzR6j=u5UecQ0JLyMFg@mail.gmail.com>

--ms6n9iWlUOUhmzHtHigJYM8VEIlHGt53t
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: de-DE

On 09.01.21 10:46, Dmitry Vyukov wrote:
> It casts sk_buff_head to sk_buff relying on equal layout of some
> prefix of these structs.

This kind of construct is used with about all kernel lists ever, so =E2=80=
=A6

--=20
-- Matthias Urlichs



--ms6n9iWlUOUhmzHtHigJYM8VEIlHGt53t--

--LKI9QKqMWdzbWwlBU64H5LWH5sCzYVe6n
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEENzGcEL8EYxehRDgJ+GyybHbBwWUFAl/5ijoFAwAAAAAACgkQ+GyybHbBwWUm
wRAAkeiexLmglp4Q7LURUYVb8b7+0HWHouJDI6U/KsMLtWTGEodmuIRQFeDu/gBlpF0BEWpcIQ/e
lg/HRYtsSVuZrbJJOrtq8ho7F6Y7IC7OCCdqsH85sVW0sWs8/kN3srkViK62bEnqoZujiAKffzi/
GXOrQpIIrl2+35mOee2ZUdMPMyUg1EZsdcV1qvLGx557qkZ5SwsBQ5D79qnIM5tiSm+L4teOBZ04
Vcjk/Q4UHxRcZzM0EMe/rDmdCB5OgoNbSEJOuEyZ9lRrWPqE13JHqtdaQaJfTI/ys8lvdWCkSqfo
JEs2a13PrhKN9b07T+0oRxuhAEBXvaH9eI5G82tMxMo0Jo9Voo96wBSp8Vm8F1A61mru0hsNdBtc
5PjZW4u6hFmQTUsQGYXwLsfrGiv9vepJrjk7XQK7Ri4xobvf8uctUJVx7ezXGGnMZ2YUMNPtRGOx
FCzEbcjrUOip1L+hSqNth4rKNnu/ScqrIc8vzvjgr8d9X5cCQ5h/gdgMLTHvY8InRM/h5XJgoL8z
q19e5aVzckTASd6rvlTpGsYOC5eJiwlR6AT8metiMv7KzlFA5jgFdEvw1d2m0noR9uNUXgd/d+4S
s64v7O8l+Vefwcx8gp48s59XJivrj0iWhNilc6BxGqsnrXoMya8bnOq+bZ8enPXFGp/fouGgWoVA
jGk=
=ORdd
-----END PGP SIGNATURE-----

--LKI9QKqMWdzbWwlBU64H5LWH5sCzYVe6n--
