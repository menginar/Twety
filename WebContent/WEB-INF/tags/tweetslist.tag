<%@ tag import="org.apache.commons.httpclient.util.URIUtil" %>
<%@ tag import="models.Tweet" %>
<%@ tag import="java.util.List" %>
<%@ tag import="lang.*" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>


<%@ attribute name="lang" required="true" rtexprvalue="true" type="java.lang.String" %>
<%@ attribute name="tlist" required="true" rtexprvalue="true" type="java.util.List" %>
<% List<Tweet> tweetlist = tlist; %>
<% LangPack l = LangFactory.getLangPack(lang); %>


<% String tweets = l.getTweets();%>
<% String returnToTop = l.getReturnToTop();%>
<% String flagAsIllegalContent = l.getFlagAsIllegalContent();%>
<% String send = l.getSend();%>
<% String cancel = l.getCancel();%>
<% String informationAboutMediaFlagging = l.getInformationAboutMediaFlagging();%>

<div class="content-main" id="timeline">
  <div class="content-header">
    <div class="header-inner">
      <h2 class="js-timeline-title"><%=tweets %>
      </h2>

    </div>
  </div>
      <div class="stream-container " data-max-id="" data-since-id="">
    <div class="stream profile-stream">
       <ol class="stream-items" id="stream-items-id">  
		<% for(Tweet tweet: tweetlist){ %>       


			<tag:tweet lang="<%=lang %>" tweet="<%=tweet %>" />


		<%} %>
		</ol>
        <div class="stream-footer ">
  <div class="timeline-end has-items has-more-items">
    <div class="stream-end">
  <div class="stream-end-inner ">
 
        <p><button type="button" class="btn-link back-to-top hidden" style="display: inline-block;"><%=returnToTop%></button></p>

  </div>
</div>

    

  </div>
</div>

      <ol class="hidden-replies-container"></ol>
      <div class="stream-autoplay-marker">
        <i class="arrow"></i>
        <span class="text"></span>
      </div>
    </div>
  </div><!--
    <div id="sensitive_flag_dialog" class="modal-container">  
  <div class="close-modal-background-target"></div>
  <div class="modal modal-small draggable">
    <div class="modal-content">
      <button type="button" class="modal-btn modal-close js-close"><span class="icon close-medium"><span class="visuallyhidden">Kapat</span></span></button>
      <div class="modal-header">
        <h3 class="modal-title">Bu medyayı işaretle</h3>
      </div>
      <div class="modal-body">
        <p class="sensitive-title">Bu zaten hassas içeriğe sahip olarak işaretlendi.</p>
        <label class="checkbox" for="sensitive-settings-checkbox">
          <input type="checkbox" id="sensitive-settings-checkbox" value="settings">
          <=changeSettingsAs %>
          Ayarlarımı hassas içeriği olan medyaları görüntülemeden önce beni uyaracak şekilde değiştir.
        </label>
        <label class="checkbox" for="sensitive-illegal-checkbox">
          <input type="checkbox" id="sensitive-illegal-checkbox" value="illegal">
          <=flagAsIllegalContent%>
        </label>
      </div>
      <div class="modal-footer">
        <button id="submit_flag_confirmation" type="button" class="btn"><%=send %></button>
        <button id="cancel_flag_confirmation" type="button" class="btn primary-btn"><%=cancel%></button>

        <div class="sensitive-confirmation">
          <a class="sensitive-learn-more" target="_blank" href="//support.twitter.com/articles/20069937"><%=informationAboutMediaFlagging%></a>
        </div>
      </div>
    </div>
  </div>
  <div class="modal-overlay"></div>
</div>-->



</div>