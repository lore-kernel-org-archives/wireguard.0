Return-Path: egbert@eggiecode.org
Received: from mail01.eggieservers.nl (mail01.eggieservers.nl
 [149.210.159.147])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 04df3155
 for <wireguard@lists.zx2c4.com>;
 Fri, 18 Nov 2016 12:40:03 +0000 (UTC)
To: Anonymous Anonymous <admin@hda.me>
References: <1587734ccf8.f42077433014.7510260495499425564@hda.me>
From: Egbert Verhage <egbert@eggiecode.org>
Message-ID: <be6d4bdc-1af6-7f3d-d732-6a7dea586da1@eggiecode.org>
Date: Fri, 18 Nov 2016 13:42:46 +0100
MIME-Version: 1.0
In-Reply-To: <1587734ccf8.f42077433014.7510260495499425564@hda.me>
Content-Type: multipart/alternative;
 boundary="------------047D5B3AEDA58F8AE2CF78E2"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Wireguard package, changed naming
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------047D5B3AEDA58F8AE2CF78E2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hey ?,

First of if you want to change something to the PPA, what is public and 
advertised on the website, make it public. In de mailing list and to me.

I'm fine with the change of ubuntu suffix to wg.
ifupdown packages is included to add wireguard network/interfaces. 
Usefull if you are using a ansible to deploying on multiple machine.

I never used bzr, that is the reason why I use git. To setup the repo 
multiple for distros just use git branches.
The code is in git: https://git.launchpad.net/wireguard, and is uses git 
submodule for the wireguard source. Then you just checkout the lastest 
snapshot and change the changelog and commit,push that.

If you are subscribed to the mailing list of wireguard, then you get an 
email that there is a new snapshot available.

Greetz,
Egbert

On 2016-11-18 12:31, Anonymous Anonymous wrote:
> I changed wireguard package naming from ubuntu1 to wg1, hope you not 
> against it. Since only ubuntu official repository packages could be 
> with ubuntu naming.
> And we don't need libmnl dependency, only libmnl-dev.
> As for ifupdown, I have no idea what it doing in PPA. Is there some 
> issues with wireguard regarding ifupdown?
> And, I have no access to bzr, but I don't use since its auto-importing 
> from git, when commits sign broken anyway. I figured what you talked 
> about change maintainer, you was talking about launchpad team, not a PPA.
>  I changed both maintainer and driver to teamname itself.
> P.S.: I included your email for snapshot tags in my email bot 
> settings. It just send notification when new version (snapshot in our 
> case) out.


--------------047D5B3AEDA58F8AE2CF78E2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p>Hey ?,</p>
    <p>First of if you want to change something to the PPA, what is
      public and <span id="result_box" class="short_text" lang="en"><span
          class="">advertised on the website</span></span>, make it
      public. In de mailing list and to me.</p>
    <p>I'm fine with the change of ubuntu suffix to wg.<br>
      ifupdown packages is included to add wireguard network/interfaces.
      Usefull if you are using a ansible to deploying on <span
        id="result_box" class="short_text" lang="en"><span>multiple </span></span>machine.</p>
    <p>I never used bzr, that is the <span id="result_box"
        class="short_text" lang="en"><span class="">reason why I use
          git. To setup the repo </span></span><span id="result_box"
        class="short_text" lang="en"><span class="">multiple for distros
          just use git branches.</span></span><br>
      The code is in git: <a class="moz-txt-link-freetext" href="https://git.launchpad.net/wireguard">https://git.launchpad.net/wireguard</a>, and is
      uses git submodule for the wireguard source. Then you just
      checkout the lastest snapshot and change the changelog and
      commit,push that.</p>
    <p>If you are subscribed to the mailing list of wireguard, then you
      get an email that there is a new snapshot available.<br>
    </p>
    Greetz,<br>
    Egbert<br>
    <br>
    <div class="moz-cite-prefix">On 2016-11-18 12:31, Anonymous
      Anonymous wrote:<br>
    </div>
    <blockquote
      cite="mid:1587734ccf8.f42077433014.7510260495499425564@hda.me"
      type="cite">
      <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
      <div
        style="font-size:10pt;font-family:Verdana,Arial,Helvetica,sans-serif;">I
        changed wireguard package naming from ubuntu1 to wg1, hope you
        not against it. Since only ubuntu official repository packages
        could be with ubuntu naming. <br>
        And we don't need libmnl dependency, only libmnl-dev. <br>
        As for ifupdown, I have no idea what it doing in PPA. Is there
        some issues with wireguard regarding ifupdown? <br>
        And, I have no access to bzr, but I don't use since its
        auto-importing from git, when commits sign broken anyway. I
        figured what you talked about change maintainer, you was talking
        about launchpad team, not a PPA.<br>
         I changed both maintainer and driver to teamname itself.<br>
        P.S.: I included your email for snapshot tags in my email bot
        settings. It just send notification when new version (snapshot
        in our case) out.<br>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------047D5B3AEDA58F8AE2CF78E2--
