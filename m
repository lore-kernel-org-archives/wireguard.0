Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA531C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 24 Mar 2022 06:07:21 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 08b9707c;
	Thu, 24 Mar 2022 06:07:19 +0000 (UTC)
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id efa4bc4e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 Mar 2022 06:07:17 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=MwH4pMpAG7W4NtOhVdyh5bKxVpcOSUJx4/x2qYs00HkEynatK1GikqNvWg795lvD2L5dkEidJmlwO0Nplcgq5HiM8rzTGPlAW6p4hYBps7M2tn7rhMmPbZORkXMVNx/bFzTBySW8Iv4hRYZ9bNUcOnzXXVemffiNuE4NwmT38oe1tYD4pwJN3zqampF4xc+7uvmgPc22NnyLeFEuyyH5bot17KSrDHM91DXJf5VzBXRqBQcdpBxYdNjHXNcwTilgomkBvXTN9np2LZLG6HEeuERbfKBapqR3QZO/7Mp3sZzwQAiuAok2KaYfH3lUEBCSUUdqNKDnNhFA42mTtjevtw==;
 s=purelymail3; d=msfjarvis.dev; v=1;
 bh=wZ1OOQ6WbFYY/ROpY/Tk1iUGbpxTYjrA50FXJR0/vbQ=; h=Received:From:To; 
DKIM-Signature: a=rsa-sha256;
 b=u9/0Zt0TyNkI2QiIfmmzBhghvJqYY72Vvp3QtjmyOu3fSwQex1whWMZikpZDiAioSGZI/AS1b0juvRZFPjXHO5KrQKkAXg8B4Hi5H5sBufhmv34E4tAleRaUo8vzAhW5TQ8Yv+pXAIWREymXEd8ca1nn569CWQy+JgePlceo9rnhNE4BsbK6H5HgTv14eHq815g0eCosGJAwHeAigLojuaZjSwmhNDxU4wOdqoDAyjVRC/6W14zWvPpxOkH6JcZ4tUXMyvdkQEAqqWXp6qoD/A/hVjQdWZvrw1d/vlUe7HZk3g1rZpoPxpNcw9dINZliURJZJtRGyeGbTah9ofCJFQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=wZ1OOQ6WbFYY/ROpY/Tk1iUGbpxTYjrA50FXJR0/vbQ=;
 h=Feedback-ID:Received:From:To; 
Feedback-ID: 322:138:null:purelymail
X-Pm-Original-To: wireguard@lists.zx2c4.com
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1361472091; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 24 Mar 2022 06:06:51 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 24 Mar 2022 06:06:51 +0000
From: Harsh Shandilya <me@msfjarvis.dev>
To: Lao Deng <laodeng99@163.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: Introduce Navigation component to Wireguard-Android
In-Reply-To: <7fd66fe3.14e.17f9a1b030e.Coremail.laodeng99@163.com>
References: <7fd66fe3.14e.17f9a1b030e.Coremail.laodeng99@163.com>
User-Agent: Purely Mail via Roundcube/1.5.1
Message-ID: <fb849ca5ae862dae8e8f06d818b2e276@purelymail.com>
X-Sender: me@msfjarvis.dev
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
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

Hi,

On 2022-03-17 22:58, Lao Deng wrote:
> I am going to add some un-related functions to Wireguard-Android . The
> final app. should look like the demo of
> com.google.android.material.bottomnavigation.BottomNavigationView ,
> =C2=A0which=C2=A0 consists of a=C2=A0 bottom navigation component and sev=
eral=C2=A0
> independent fragments( or activities ) .=C2=A0
>=20
>=20
> I am wondering how to introduce this navigation component to the
> wireguard-android=C2=A0 project with the least modification :) Could you
> please shed some light on it ?
> Thankyou for your attention :)=C2=A0=C2=A0
>=20

I'm a bit confused, is this change something you are proposing for the=20
upstream project or are you looking for assistance to implement this in=20
a fork?

I don't think we want a Bottom Navigation component in the app itself=20
since it adds no value to the app, the only new destination we could add=20
with it would be a quicker entry into settings which is not a=20
high-priority destination requiring such a prominent navigation action.

If you want to add it to a fork, the only real help I can provide is=20
that MainActivity inflates the main_activity.xml layout which in turn=20
handles inflating TunnelListFragment, so you'd want to make changes to=20
MainActivity and its layout for adding the component.

--
Harsh Shandilya
